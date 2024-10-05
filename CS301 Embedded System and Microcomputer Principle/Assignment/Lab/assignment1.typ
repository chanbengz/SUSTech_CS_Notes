#import "template.typ": *

#show: project.with(
  title: "ESMP Lab Assignment 1",
  authors: (
    (
      name: "陈贲",
      organization: "12212231",
      email: "chenb2022@mail.sustech.edu.cn"
    ),
  ),
)

= Introduction
我们在学习计算机的过程中总是被保护的太好：从应用层开始搭建网站，写算法，编写小游戏... 这些都有标准库、第三方库、框架、操作系统等等支撑，都是为了让我们更加专注于业务逻辑，而不需要任何底层计算机知识。但是当我们需要为底层编写程序的时候，这些抽象层就成了我们的障碍。第一次接触底层的同学可能会感到困惑和无助：上百个寄存器、数千页的参考手册，实现一个小功能需要阅读大量的文档。比如在STM32中，如果想操作LED灯的亮灭，我们需要：
+ 了解LED灯连接的引脚是哪个, 然后绑定到GPIO的寄存器
+ 设置GPIO的模式、速度、上拉下拉等属性
+ 编程的时候，要牢记寄存器的地址、引脚的编号等等

这些配置信息对于不同的MCU和外设又是不同的，记忆和理解的难度非常大。所以，我们需要一套解决方案，让我们避开这些细节，专注于业务逻辑的实现。所以在STM32开发中，我们可以使用 HAL (Hardware Abstraction Layer) 库。

按照惯例，先看官方对HAL是怎么定义的#cite(<stm-website>): 

#quote()[
The HAL driver layer provides a simple, generic multi-instance set of APIs (application programming interfaces) to interact with the upper layer (application, libraries and stacks). The HAL driver APIs are split into two categories: generic APIs, which provide common and generic functions for all the STM32 series and extension APIs, which include specific and customized functions for a given line or part number. The HAL drivers include a complete set of ready-to-use APIs that simplify the user application implementation. For example, the communication peripherals contain APIs to initialize and configure the peripheral, manage data transfers in polling mode, handle interrupts or DMA, and manage communication errors.
]

简单而言，直接操作寄存器太过繁琐，对用户不友好，所以意法半导体提供了一层封装，将抽象的寄存器操作转换成更加直观的函数调用，就是HAL库。细心的同学可能会发现，HAL的概念跟OS中的syscall和固件中的SBI很像，虽然HAL不提供隔离、权限管理等安全功能。个人认为，HAL可以称为STM32硬件版的libc。同时，通用的HAL API可以让用户在不同的STM32系列中移植代码变得更加容易，只需要修改一些配置即可。

HAL库的API分为两类：通用API和扩展API。通用API适用于所有STM32系列，而扩展API则是针对特定型号的。HAL库包含了一套完整的API，可以简化用户应用的实现。比如，通信外设包含了初始化和配置外设、在轮询模式下管理数据传输、处理中断或DMA、处理通信错误等API。

= From Register to HAL

为了减轻程序员的记忆负担，STM32CubeMX 会帮助定义一些宏，比如`GPIOx`代表各个GPIO组的寄存器的地址，`ODR`, `BSRR`代表各组的具体寄存器偏移等等，但是这些宏还不够直观，所以HAL提供了一些函数使我们的代码从

```c
GPIOF->BSRR = 0x00000001;
```

变成

```c
HAL_GPIO_WritePin(GPIOF, GPIO_PIN_0, GPIO_PIN_SET);
```

这个函数的实现其实不复杂

```c
void HAL_GPIO_WritePin(GPIO_TypeDef* GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState)
{
    if(PinState != GPIO_PIN_RESET)
    {
        GPIOx->BSRR = GPIO_Pin;
    }
    else
    {
        GPIOx->BSRR = (uint32_t)GPIO_Pin << 16;
    }
}
```

`GPIOx`是GPIO组的地址(可以直接用宏)，`GPIO_Pin`是绑定到GPIO的引脚在GPIO ODR/IDR寄存器中对应的位(如果定义了设备名也可以用宏)，`PinState`是要设置的状态。这个函数隐藏了`BSRR`寄存器的细节: 高16位是Set，低16位是Reset。这样我们就不需要记住`BSRR`寄存器的细节，只需要记住`HAL_GPIO_WritePin`这个函数的调用方式即可。

= From HAL API to Calling Procedure

知其然还需知其所以然。本节我们将进入HAL控制外设时的流程，并将在下一节具体深入代码实现。本节会涵盖GPIO的函数调用过程，直到叶子节点的寄存器操作。

GPIO 的功能其实比较简单。HAL库中描述到GPIO有Input, Output, Analog, Alternate function 和 External interrupt/event lines 这五种模式，目前比较常用的是Input和Output。在实际使用 GPIO 之前，我们需要
+ 调用 `__HAL_RCC_GPIOx_CLK_ENABLE() ` 启用每一组 GPIO APB2 时钟。这个函数在`Core/Src/gpio.c`中的`MX_GPIO_Init`函数中调用。
+ 调用 `HAL_GPIO_Init(GPIO_TypeDef  *GPIOx, GPIO_InitTypeDef *GPIO_Init)` 初始化每一组 GPIO 的模式、速度、上拉下拉等属性。这个函数在`Driver/Src/stm32f1xx_hal_gpio.c`中定义，会在我们设置之后由CubeMX生成到`Core/Src/gpio.c`中。
+ 以上两步都在`Core/Src/gpio.c`中完成，主程序初始化时会调用`MX_GPIO_Init()`。

然后就可以愉快地使用 HAL 库来通过 GPIO 控制外设了。相关函数其实也很简单，只有4个主要函数，都在`Driver/src/stm32f1xx_hal_gpio.c`中实现：
- `GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)` 传入 GPIO 组的地址和引脚编号（其实是一个宏，值是引脚对应位为1的常量，比如第`GPIOA_Pin3`=`0x00000004`），返回引脚的状态， `GPIO_PIN_RESET` 和 `GPIO_PIN_SET`
- `void HAL_GPIO_WritePin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState)` 传入 GPIO 组的地址、引脚编号和要设置的状态，设置引脚的状态
- `void HAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)` 传入 GPIO 组的地址和引脚编号，翻转引脚的状态
- `HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)` 传入 GPIO 组的地址和引脚编号，锁定引脚，防止意外操作

最后关机/重启时，还需要 `HAL_GPIO_DeInit` 来重置 GPIO Register 的状态到默认值，这个过程结构与Init一致但操作是相反的。除此之外，还有一些其他不需要主动调用但可能需要用户定义的函数，有 `HAL_GPIO_EXTI_IRQHandler` 用于处理外部退出中断，`HAL_GPIO_EXTI_Callback` 用于处理外部中断的回调函数。

= Code Implementation

书接上文，具体地来分析一下HAL库中GPIO的代码实现，以便我们写HAL代码的时候能心有Register。以下分析的函数使用了几个宏，这里也把它们贴出来并先简单分析以下。首先在`Core/Inc/main.h`中自动生成了Pin脚的宏定义：

```c
#define KEY0_Pin GPIO_PIN_5
#define KEY0_GPIO_Port GPIOC
#define LED0_Pin GPIO_PIN_8
#define LED0_GPIO_Port GPIOA
#define KEY1_Pin GPIO_PIN_15
#define KEY1_GPIO_Port GPIOA
#define LED1_Pin GPIO_PIN_2
#define LED1_GPIO_Port GPIOD
```

然后是几个功能性的宏定义，这些宏定义在`Driver/Inc/stm32f1xx_hal.h`中。每个寄存器组都有一套自己的时钟与其enable/disable函数，比如GPIOA的使能函数(宏)#footnote[
  这里的do{ ... } while(0) 其实用了一个宏的小技巧，用于避免宏展开后的语法错误，具体可以参考https://zhuanlan.zhihu.com/p/357839758
]

```c
#define __HAL_RCC_GPIOA_CLK_ENABLE() \
    do { \
        __IO uint32_t tmpreg; \
        SET_BIT(RCC->APB2ENR, RCC_APB2ENR_IOPAEN);\
        /* Delay after an RCC peripheral clock enabling */\
        tmpreg = READ_BIT(RCC->APB2ENR, RCC_APB2ENR_IOPAEN);\
        UNUSED(tmpreg); \
    } while(0U)

```

直接将系统时钟的设置外设时钟配置寄存器`RCC->APB2ENR`中对应的GPIOA时钟的位设置位1即可，然后在手动加一段延时确保时钟使能完成。#footnote[
  这里的`UNUSED(tmpreg)`是用于欺骗编译器，因为tmpreg变量在这里没有用到，但是又由于`READ_BIT`的表达式值会被优化掉而不能直接删除，所以用这个宏来避免警告。
]

```c
#define SET_BIT(REG, BIT)     ((REG) |= (BIT))
#define CLEAR_BIT(REG, BIT)   ((REG) &= ~(BIT))
#define READ_BIT(REG, BIT)    ((REG) & (BIT))
#define CLEAR_REG(REG)        ((REG) = (0x0))
```

这四个宏比较好理解，用位运算来设置、清除、读取、清零寄存器的某一位。这里的`REG`是寄存器的地址，`BIT`是要操作的位#footnote[
  可以同时设置多个位，比如设置第二、四位，那么可以写成`SET_BIT(REG, BIT2 | BIT4)`
]。建议`REG`和`BIT`都用宏。

```c
#define MODIFY_REG(REG, CLEARMASK, SETMASK)  WRITE_REG((REG), (((READ_REG(REG)) & (~(CLEARMASK))) | (SETMASK)))
```

这个宏用于批量修改寄存器的值，先通过`READ_REG`读取寄存器的值，然后通过位运算用`CLEARMASK`保护其他位，只修改特定位的值为`SETMASK`。例如要将`CRL`中第2个引脚的模式修改为`1001`(Pull-up/Pull-down Output)，可以这样写：

```c
MODIFY_REG(GPIOA->CRL, GPIO_CRL_MODE2 | GPIO_CRL_CNF2, GPIO_CR_MODE_OUTPUT_PP);
```

== MX_GPIO_Init

这个函数是由CubeMX生成的，所以我选择了我们lab的课上练习的代码作为示例。`Core/Src/gpio.c`中`MX_GPIO_Init`函数：

```c
void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct = {0};

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOD_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED0_GPIO_Port, LED0_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET);

  /*Configure GPIO pin : PtPin */
  GPIO_InitStruct.Pin = KEY0_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(KEY0_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : PtPin */
  GPIO_InitStruct.Pin = LED0_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED0_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : PtPin */
  GPIO_InitStruct.Pin = KEY1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_PULLUP;
  HAL_GPIO_Init(KEY1_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : PtPin */
  GPIO_InitStruct.Pin = LED1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(LED1_GPIO_Port, &GPIO_InitStruct);

}
```

首先要启用每个用户配置的GPIO组的时钟，即调用开头的`__HAL_RCC_GPIOx_CLK_ENABLE()`函数。然后重置输出口的状态，避免不定态。最后再分别对每个引脚做初始化操作。

每个 GPIO 引脚都有一个`GPIO_InitStruct`，包括引脚位，模式(前面提到的5种)，上拉下拉，速度，然后传入到`HAL_GPIO_Init`函数中。这个函数会根据`GPIO_InitStruct`的配置来初始化 GPIO 引脚。猜测这么做的原因一是比较清晰，二是避免函数参数太长，不易阅读。

```c
typedef struct
{
  uint32_t Pin;     /*!< Specifies the GPIO pins to be configured.
                         This parameter can be any value of @ref GPIO_pins_define */

  uint32_t Mode;    /*!< Specifies the operating mode for the selected pins.
                         This parameter can be a value of @ref GPIO_mode_define */

  uint32_t Pull;    /*!< Specifies the Pull-up or Pull-Down activation for the selected pins.
                         This parameter can be a value of @ref GPIO_pull_define */

  uint32_t Speed;   /*!< Specifies the speed for the selected pins.
                         This parameter can be a value of @ref GPIO_speed_define */
} GPIO_InitTypeDef;
```

== HAL_GPIO_Init

这个函数比较长，所以只展示核心的部分。这个函数通过while和位运算从低位到高位批量初始化引脚，每次初始化先

```c
/* Based on the required mode, filling config variable with MODEy[1:0] and CNFy[3:2] corresponding bits */
switch (GPIO_Init->Mode)
{
  /* If we are configuring the pin in OUTPUT push-pull mode */
  case GPIO_MODE_OUTPUT_PP:
    /* Check the GPIO speed parameter */
    assert_param(IS_GPIO_SPEED(GPIO_Init->Speed));
    config = GPIO_Init->Speed + GPIO_CR_CNF_GP_OUTPUT_PP;
    break;

  /* If we are configuring the pin in OUTPUT open-drain mode */
  case GPIO_MODE_OUTPUT_OD:
    /* Check the GPIO speed parameter */
    assert_param(IS_GPIO_SPEED(GPIO_Init->Speed));
    config = GPIO_Init->Speed + GPIO_CR_CNF_GP_OUTPUT_OD;
    break;

  /* If we are configuring the pin in ALTERNATE FUNCTION push-pull mode */
  case GPIO_MODE_AF_PP:
    /* Check the GPIO speed parameter */
    assert_param(IS_GPIO_SPEED(GPIO_Init->Speed));
    config = GPIO_Init->Speed + GPIO_CR_CNF_AF_OUTPUT_PP;
    break;

  /* If we are configuring the pin in ALTERNATE FUNCTION open-drain mode */
  case GPIO_MODE_AF_OD:
    /* Check the GPIO speed parameter */
    assert_param(IS_GPIO_SPEED(GPIO_Init->Speed));
    config = GPIO_Init->Speed + GPIO_CR_CNF_AF_OUTPUT_OD;
    break;

  /* If we are configuring the pin in INPUT (also applicable to EVENT and IT mode) */
  case GPIO_MODE_INPUT:
  case GPIO_MODE_IT_RISING:
  case GPIO_MODE_IT_FALLING:
  case GPIO_MODE_IT_RISING_FALLING:
  case GPIO_MODE_EVT_RISING:
  case GPIO_MODE_EVT_FALLING:
  case GPIO_MODE_EVT_RISING_FALLING:
    /* Check the GPIO pull parameter */
    assert_param(IS_GPIO_PULL(GPIO_Init->Pull));
    if (GPIO_Init->Pull == GPIO_NOPULL)
    {
      config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_FLOATING;
    }
    else if (GPIO_Init->Pull == GPIO_PULLUP)
    {
      config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_PU_PD;

      /* Set the corresponding ODR bit */
      GPIOx->BSRR = ioposition;
    }
    else /* GPIO_PULLDOWN */
    {
      config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_PU_PD;

      /* Reset the corresponding ODR bit */
      GPIOx->BRR = ioposition;
    }
    break;

  /* If we are configuring the pin in INPUT analog mode */
  case GPIO_MODE_ANALOG:
    config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_ANALOG;
    break;

  /* Parameters are checked with assert_param */
  default:
    break;
}
```

根据引脚模式的不同进行不同的配置，并给`config`赋值后续统一设置CNF和Mode。例如对于输入引脚，要Set/Reset ODR寄存器对应位

```c
else if (GPIO_Init->Pull == GPIO_PULLUP)
{
  config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_PU_PD;

  /* Set the corresponding ODR bit */
  GPIOx->BSRR = ioposition;
}
else /* GPIO_PULLDOWN */
{
  config = GPIO_CR_MODE_INPUT + GPIO_CR_CNF_INPUT_PU_PD;

  /* Reset the corresponding ODR bit */
  GPIOx->BRR = ioposition;
}
```

然后配置Port Configure寄存器。课上我们学到，CRL和CRH共64位，每个引脚占4位(所以`registeroffset`那里左移2位)。每个Port的配置是先2位的Mode，再是2位的CNF，具体含义在此不过多赘述。最后调用`MODIFY_REG`函数修改寄存器的值。上面的`config`是Mode和CNF的组合，`registeroffset`是引脚在CRL/CRH中的位置。

```c
/* Check if the current bit belongs to first half or last half of the pin count number
 in order to address CRH or CRL register*/
configregister = (iocurrent < GPIO_PIN_8) ? &GPIOx->CRL     : &GPIOx->CRH;
registeroffset = (iocurrent < GPIO_PIN_8) ? (position << 2u) : ((position - 8u) << 2u);

/* Apply the new configuration of the pin to the register */
MODIFY_REG((*configregister), ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << registeroffset), (config << registeroffset));
```

最后是设置退出模式(EXIT寄存器)，具体步骤是
- 启用AFIO时钟
```c
__HAL_RCC_AFIO_CLK_ENABLE();
temp = AFIO->EXTICR[position >> 2u];
CLEAR_BIT(temp, (0x0Fu) << (4u * (position & 0x03u)));
SET_BIT(temp, (GPIO_GET_INDEX(GPIOx)) << (4u * (position & 0x03u)));
AFIO->EXTICR[position >> 2u] = temp;
```
- 设置中断(IMR 寄存器)和事件(EMR 寄存器)掩码
```c
if ((GPIO_Init->Mode & GPIO_MODE_IT) == GPIO_MODE_IT)
// if ((GPIO_Init->Mode & GPIO_MODE_EVT) == GPIO_MODE_EVT)
{
    SET_BIT(EXTI->IMR, iocurrent); // or EMR
}
else
{
    CLEAR_BIT(EXTI->IMR, iocurrent); // or EMR
}
```
- 设置上升沿触发(RTSR 寄存器)，禁用下降沿触发(FTSR 寄存器)，或者反过来
```c
if ((GPIO_Init->Mode & RISING_EDGE) == RISING_EDGE)
{
    SET_BIT(EXTI->RTSR, iocurrent); // or FTSR
}
else
{
    CLEAR_BIT(EXTI->RTSR, iocurrent); // or FTSR
}
```

整个初始化过程就结束了。小结一下，HAL库的GPIO初始化过程是先启用时钟，然后初始化引脚的配置寄存器(CRL/CRH)来设置引脚的模式、速度、上拉下拉等属性，最后设置退出模式(EXIT寄存器)。根据不同模式可能还需要设置ODR/IDR, BSR/BSRR寄存器。

== HAL_GPIO_ReadPin

下面四个功能函数都比较简单。这里的`GPIO_PinState`是一个枚举类型，只有两个值`GPIO_PIN_RESET`和`GPIO_PIN_SET`，分别对应引脚的0(低电平)和1(高电平)。

```c
GPIO_PinState HAL_GPIO_ReadPin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
  GPIO_PinState bitstatus;

  /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  if ((GPIOx->IDR & GPIO_Pin) != (uint32_t)GPIO_PIN_RESET)
  {
    bitstatus = GPIO_PIN_SET;
  }
  else
  {
    bitstatus = GPIO_PIN_RESET;
  }
  return bitstatus;
}
```

先通过位运算只读取IDR寄存器对应位的1比特，但bitstatus肯定不是1bit，所以需要判断是否为0，然后返回`GPIO_PIN_SET`或`GPIO_PIN_RESET`。

注意，这个函数读取的是IDR寄存器，表明这个函数只能读取输入引脚的状态，如果是输出引脚，读出来的值没有意义。

== HAL_GPIO_WritePin

写入引脚的状态，通过写入BSRR(Set/Reset)寄存器实现。

```c
void HAL_GPIO_WritePin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin, GPIO_PinState PinState)
{
  /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));
  assert_param(IS_GPIO_PIN_ACTION(PinState));

  if (PinState != GPIO_PIN_RESET)
  {
    GPIOx->BSRR = GPIO_Pin;
  }
  else
  {
    GPIOx->BSRR = (uint32_t)GPIO_Pin << 16u;
  }
}
```

这个实现很巧妙。因为低16位的Set的优先级要高于高16的Reset，所以需要两次操作来保证Reset的正常。如果要设置对应位为1，直接将对应位写入即可。如果要设置对应位为0，这里直接左移16位写入到高16位的BRx，而BSx全部变为0不会影响Reset。同时，因为Set/Reset也会改变ODR，所以其他bit置0不会影响其他引脚，这比直接写入ODR寄存器要高效一点。

== HAL_GPIO_TogglePin

TogglePin 将对应引脚的状态翻转，通过读取ODR寄存器的值，然后将对应位的值取反写入BSRR寄存器实现。

```c
void HAL_GPIO_TogglePin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
  uint32_t odr;

  /* Check the parameters */
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  /* get current Ouput Data Register value */
  odr = GPIOx->ODR;

  /* Set selected pins that were at low level, and reset ones that were high */
  GPIOx->BSRR = ((odr & GPIO_Pin) << GPIO_NUMBER) | (~odr & GPIO_Pin);
}
```

通过位运算一行实现功能，如果该bit是1，则设置BRx为1，BSx为0；否则相反。

== HAL_GPIO_LockPin

GPIO 的配置寄存器的锁功能有LCKR 寄存器支持，所以代码实现并不复杂，也不需要类似OS的软件锁机制。

```c
HAL_StatusTypeDef HAL_GPIO_LockPin(GPIO_TypeDef *GPIOx, uint16_t GPIO_Pin)
{
  __IO uint32_t tmp = GPIO_LCKR_LCKK;

  /* Check the parameters */
  assert_param(IS_GPIO_LOCK_INSTANCE(GPIOx));
  assert_param(IS_GPIO_PIN(GPIO_Pin));

  /* Apply lock key write sequence */
  SET_BIT(tmp, GPIO_Pin);
  /* Set LCKx bit(s): LCKK='1' + LCK[15-0] */
  GPIOx->LCKR = tmp;
  /* Reset LCKx bit(s): LCKK='0' + LCK[15-0] */
  GPIOx->LCKR = GPIO_Pin;
  /* Set LCKx bit(s): LCKK='1' + LCK[15-0] */
  GPIOx->LCKR = tmp;
  /* Read LCKK register. This read is mandatory to complete key lock sequence */
  tmp = GPIOx->LCKR;

  /* read again in order to confirm lock is active */
  if ((uint32_t)(GPIOx->LCKR & GPIO_LCKR_LCKK))
  {
    return HAL_OK;
  }
  else
  {
    return HAL_ERROR;
  }
}
```

LCKR[16]是LCKR寄存器的使能位，称为Lock key。LCKR 寄存器的写入也需要原子操作，所以按照规范，修改这个寄存器需要一定步骤：
+ Write `LCKK = 1 + LCKR[15-0]`，这个就是上面代码的`tmp`的值
+ Write `LCKK = 0 + LCKR[15-0]`
+ Write `LCKK = 1 + LCKR[15-0]`
+ Read LCKR
+ Read LCKR (可选，用于确认锁启用)

如果这个操作不完整，写入操作会以外停止并退出。所以上面的代码就干了这么几件事，最后返回成功与否，`HAL_OK`或`HAL_ERROR`。

== HAL_GPIO_DeInit

相比于Init，DeInit的操作就简单很多了，直接将对应位的设置和数据寄存器清零即可。

```c
/* Get current io position */
iocurrent = (GPIO_Pin) & (1uL << position);

if (iocurrent)
{
  /*------------------------- EXTI Mode Configuration --------------------*/
  /* Clear the External Interrupt or Event for the current IO */

  tmp = AFIO->EXTICR[position >> 2u];
  tmp &= 0x0FuL << (4u * (position & 0x03u));
  if (tmp == (GPIO_GET_INDEX(GPIOx) << (4u * (position & 0x03u))))
  {
    tmp = 0x0FuL << (4u * (position & 0x03u));
    CLEAR_BIT(AFIO->EXTICR[position >> 2u], tmp);

    /* Clear EXTI line configuration */
    CLEAR_BIT(EXTI->IMR, (uint32_t)iocurrent);
    CLEAR_BIT(EXTI->EMR, (uint32_t)iocurrent);

    /* Clear Rising Falling edge configuration */
    CLEAR_BIT(EXTI->RTSR, (uint32_t)iocurrent);
    CLEAR_BIT(EXTI->FTSR, (uint32_t)iocurrent);
  }
  /*------------------------- GPIO Mode Configuration --------------------*/
  /* Check if the current bit belongs to first half or last half of the pin count number
   in order to address CRH or CRL register */
  configregister = (iocurrent < GPIO_PIN_8) ? &GPIOx->CRL     : &GPIOx->CRH;
  registeroffset = (iocurrent < GPIO_PIN_8) ? (position << 2u) : ((position - 8u) << 2u);

  /* CRL/CRH default value is floating input(0x04) shifted to correct position */
  MODIFY_REG(*configregister, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << registeroffset), GPIO_CRL_CNF0_0 << registeroffset);

  /* ODR default value is 0 */
  CLEAR_BIT(GPIOx->ODR, iocurrent);
}
```

清除AFIO时钟中的外部中断配置(EXTICR 寄存器)，EXIT 寄存器中的IMR, EMR, RTSR, FTSR 寄存器，然后清除GPIO的配置寄存器(CRL/CRH)和ODR。

= Trouble Shooting

由于一开始对HAL库不熟悉，难免会遇到一些问题。于是从失败中学习，在这一节总结目前遇到的问题和解决方法。

== 外部中断错误设置导致不能退出

在Lab练习中，我们曾实现了按按键改变LED灯的闪烁状态。本人于是尝试将按键轮询(while true)的方式改为按键触发外部中断的方式实现，但会导致板子卡死无响应。

在排查代码逻辑问题后，上网检索发现#cite(<hal-gpio>)如果使用按键外部中断会导致频繁触发中断(未消抖)，从而不能退出中断，导致卡死。因为中断处理函数会先清除中断标志位再执行CallBack函数，如果CallBack函数在执行过程中又被按键触发中断，会导致嵌套中断而卡死不能退出。解决方案是将清除中断标志位的操作放在CallBack函数中，这样就不会导致嵌套中断。

```c
void HAL_GPIO_EXTI_IRQHandler(uint16_t GPIO_Pin)
{
  /* EXTI line interrupt detected */
  if(__HAL_GPIO_EXTI_GET_IT(GPIO_Pin) != RESET)
  {
    // __HAL_GPIO_EXTI_CLEAR_IT(GPIO_Pin);
    HAL_GPIO_EXTI_Callback(GPIO_Pin);
    __HAL_GPIO_EXTI_CLEAR_IT(GPIO_Pin);
  }
}
```

= Conclusion

HAL 库的操作都是严格按照Reference Manual实现的。如果开发者对手册不熟悉，难免会写出错误的程序导致需要花大量时间阅读手册来排查问题。所以HAL库的存在是非常有必要的。

经过这次源码学习，我回顾了手册中关于GPIO的规范，同时对HAL的实现深入了解，也使自己能写出正确的寄存器代码了。

HAL GPIO库还提供了拓展功能，即eventout 内核事件输出，这个功能可以将内核事件输出到GPIO引脚，用于多个ARM同步。这个功能比较高级，暂时不做深入讨论。

#bibliography("ref.bib")

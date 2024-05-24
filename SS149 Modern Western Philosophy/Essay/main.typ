#import "@preview/ssrn-scribe:0.4.9": *

#show: paper.with(
  font: "CM Roman",
  fontsize: 12pt,
  maketitle: true,
  title: [Critical Evaluation on $17^"th"$ Century Philosophical Thoughts],
  authors: (
    (
      name: "Ben Chen",
      affiliation: "Department of Computer Science and Engineering, SUSTech",
      email: "chenb2022@mail.sustech.edu.cn",
      note: "",
    ),
  ),
  date: "May 2024",
  abstract: [
    In the final essay, we will critically explore serveral key philosophical aruguments and their opponents from the early modern period in the $17^"th"$ century, focusing on the nature of sense, perception, knowledge, causality, movement and etc. For every question proposed, we will present in premise-conclusion form briefly, and then critically examine the soundness and validity of them. Finally, the reconstruction and opponents will be following. The interplay of these arguments and counterarguments provides a rich tapestry of debate on fundamental philosophical issues, reflecting a dynamic period of intellectual history where the very fabric of understanding was questioned and redefined.
  ],
  keywords: [
    Descartes,
    Spinoza,
    Cavendish,
    Malebranche,
    Locke,
    Analytic Philosophy],
  bibliography: bibliography("ref.bib", title: "References", style: "apa"),
)

#set enum(indent: 2em)
= Introduction
This discourse delves into the heart of philosophical debates that marked the Early Modern period, a time of revolutionary thought that challenged established norms and laid the groundwork for our contemporary understanding of the world. We examine serveral arguments of Descartes, Spinoza, Cavendish, and Locke, each of whom brought unique perspectives to questions of knowledge, reality, and causality. Descartes' wax argument questions the reliability of sensory perception, while Spinoza's critique of final causes redefines our understanding of purpose and cause in nature. Cavendish's propositions challenge Cartesian mind-body dualism, advocating for the centrality of matter. Lastly, Locke's argument explores the potential for matter to think, an idea met with critique by Mary Astell, who defended the necessity of an immaterial substance for thought. These philosophical debates, rich in their diversity and depth, encapsulate a transformative era that continues to shape our intellectual landscapes today. It's not fair to criticize former arguments, as we're standing on the giant's shoulder to see further than our ancients. However, we can still evaluate their arguments and see if they are still valid in the contemporary world. If not, we can propose some modifications to make them more convincing and knowing why they are wrong can also help us to know more about the world.

= Evaluation on Descartes's Wax Argument
René Descartes's wax argument, which presented in the second meditation of his work _Meditations on First Philosophy_, says a piece of wax fresh from the honeycomb: it has a certain taste, smell, color, shape, size, and is solid and tangible. However, when the wax is brought near to a flame, all of these sensible qualities change; it loses its taste and smell, the color changes, it becomes liquid and hot, and its size increases. Yet, Descartes points out, it remains the same piece of wax @descartes-1984. The argument is established by
 + *Premise*: Everything revealed by sense/imagination changed.
 + *Premise*: The wax itself did not change.
 + *Conclusion*: The wax is not revealed by the senses/imagination.
Although, the premise and conclusion seem to be logically connected, in my point of view, it has some implict premises to be extended so as to make argument stronger. I think the premise 1 is infered from two other crucial premises:
 + *Premise*: The mind and sense/imagination are distinct.
 + *Premise*: If everything revealed by sense/imagination did not change, then the mind are the same as sense/imagination.
 + *Conclusion*: Everything revealed by sense/imagination changed.
To explain more, the premise 2 of my reconstruction means that, mind is something that can observe the nature of the matter which remains eternally identical, independent of sense/imagination since they are just perceiving the outra presentation of matter. And if everything revealed by sense/imagination did not change, then we cannot distinguish the mind from sense/imagination. Thus, I think we have to declaim the dualism of mind and sense and it is a essential reconstruction or complement to Descartes's argument, without which the premise 1 will lose its validity.
 
However, the soundness of the argument is opposed. In this paragraph, I will present one counterargument against the soundness of premise 2. In the opponent's view, the wax did change since the argument can be constructed like this:
  + *Premise*: If it is declared that the nature of everything is not changed, then we need point out what nature of that thing is eternal
  + *Premise*: We cannot know the nature of the wax.
  + *Conclusion*: The nature of the wax is changed. [Universal Initialization & Modus Tollens]
This counterargument, which is valid obviously, points out that we human beings can never know the true nature of everything, but can only infer part of it from the experience, whether the knowledge is right or not. Nowadays, even with modern science, we can only take a glance on the surface of the nature. And the first premise comes from the wisdom of Endurantism. To some extent, I stand on the side of Endurantism, and it reminds me of the Ship of Theseus. The eternalty of the nature of everything is not apparent, and we cannot declare conceitedly that properities of the wax has changed until we know exactly what those properities are. Is the ship changed? Is the wax changed? We don't know. Thus, the opponents's argument is sound for me.

= Evaluation on Descartes's argument against one objection
In the argument of ontology and the existence of God, Descartes was challenged with four powerful objections which he defended himself with arguments against. With the critic attcking on the minor premise that the existence belongs to the nature of God, he response from Descartes is quite charming to me. 
#quote(attribution: [Descartes], block: true)[
  But when I concentrate more carefully, it is quite evident that existence can no more be separated from the essence of God than the fact that its three angles equal two right angles can be separated from the essence of a triangle, or than the idea of a mountain can be separated from the idea of a valley. I cannot think of a mountain without a valley, also I cannot think of a God without existence.
]
The argument is reconstructed as follows
  + *Premise*: If God is perfect, the nature of God is perfect.
  + *Premise*: If the nature of something is perfect, existence is essence in the nature of that thing.
  + *Premise*: The concept of God is perfect.
  + *Conclusion*: Existence is a essence of God.
The argument is apparently valid. However, the argument is based on the assumption that nature is everything, prioir to the existence of the thing. Thus, in my point of view, the premise 2 is vulnerable and causes the unsoundess of the argument. I can construct the counterargument as follows:
  + *Premise*: If everything that exists has the same mode, then the mode is not the essence of everything.
  + *Premise*: Everything that has nature exists.
  + *Conclusion*: The mode, which is existence, is not the essence of everything.
The argument and counterargument reflect a debate between essentialism and existentialism. For instance, consider the classic question from childhood: "What comes first, the egg or the chicken?" Here, the egg represents existence, and the chicken represents essence. If we say the egg comes first, we imply that a chicken must start as an egg and cannot develop into a chicken without first existing as an egg. This suggests that something must exist before it can have a nature. Conversely, if we say the chicken comes first, we argue that the egg is produced by the chicken, meaning that existence stems from essence. Personally, I find the former argument more convincing, indicating my essentialist leanings. However, I am comfortable with both viewpoints. Although they seem contradictory, they can both be true from different perspectives.

= Evaluation on Spinoza's argument against final causes, along with Leibniz’s response
To against the teleology, Spinoza mainly argues from two points of view @spinoza-2002.
#quote(attribution: [Spinoza, Ethics], block: true)[
  Not many words will be required now to show that Nature has no end set before it, and that all final causes are nothing but human fictions. For I believe I have already sufficiently established it, both by the foundations and causes from which I have shown this prejudice to have had its origin, and also by P16, P32C1 and C2, and all those [propositions] by which I have shown that all things proceed by a certain eternal necessity of nature, and with the greatest perfection. 
  Again, this doctrine takes away God's perfection. For if God acts for the sake of an end, he necessarily wants something which he lacks.
]
To construct his argument, we can write it as follows:
  + *Premise*: We know that everything proceeds by a certain eternal necessity of nature with the greatest perfection.
  + *Premise*: If there are final causes, then we do not know everything proceeds by a certain eternal necessity of nature with the greatest perfection.
  + *Premise*: If God acts for the sake of an end, he necessarily wants something which he lacks.
  + *Conclusion*: God cannot act for the sake of an end, and there are no final causes.
For the first argument [Premise 1 & 2], Spinoza argues that attributing final causes to nature is a projection of human psychology onto the natural world. Humans often ascribe purposes to natural events because they tend to understand things in terms of their own goals and purposes. This anthropomorphic view leads to the mistaken belief that nature acts with ends in mind, just as humans do. According to Spinoza [Premise 3], nature does not act according to a plan or for the sake of achieving specific outcomes. Natural events are the result of the immutable laws of nature, not the pursuit of particular goals. The concept of final causes suggests that nature has preferences or intentions, which Spinoza denies.

However, Leibniz, in his works, provides a nuanced response to Spinoza's rejection of final causes. While he agrees with Spinoza on the importance of understanding natural phenomena through efficient causes, he does not dismiss final causes altogether. Leibniz's theological argument is summerized as follows:
  + *Premise*: If God exists, then the world was created by a mind who aims at the good.
  + *Premise*: If the world was created by a mind who aims at the good, then there are (transcendent) final causes.
  + *Conclusion*: There are (transcendent) final causes.
and along with the scientific argument:
  + *Premise*: If scientific laws are demonstrated from the principle of perfection and order, then there must be a final cause
  + *Premise*: The laws are demonstrated from the principle of perfection and order.
  + *Conclusion*: There must be a final cause
Leibniz does not see teleology as a mere projection of human psychology onto nature. Instead, he believes that purpose and design are inherent in the structure of the universe. He sees evidence of this in the intricate and harmonious relationships between different parts of nature, suggesting a purposeful order rather than random or indifferent processes.
Leibniz also argues that God, being omniscient and perfect, has designed the world in the best way, meaning that everything in the world serves a purpose within the grand design. This view contrasts with Spinoza's more deterministic and impersonal view of nature.

From my perspective, I find Spinoza's argument more convincing. Though modern science like biology finds that organisms operate on a mechanism of aging and self-destructing, which supports the teleology. The truth lies beneath the surface, that the cells, basic units of life, are designed to live forever by splitting and reproducting. Aging is barely a intermediate state of the eternal life. Thus, the teleology is well-supported by the nature, at least for the time being, with current knowledge.

= Evaluation on Cavendish's argument for the impossibility of transfer of motion
Margaret Cavendish argued against the possibility of the transfer of motion, presenting a view contrary to the mechanistic philosophy at that period @newcastle-2001 @cavendish-2021.
#quote(attribution: [Cavendish, Observations], block: true)[
  Motion being material and inseparable from matter, cannot be imparted without matter; and if not, then the body that receives motion would increase in bulk, and the other that loses motion would decrease, by reason of the addition and diminution of the parts of matter, which must of necessity increase and lessen the bulk of the body: the contrary whereof is sufficiently known.
]
The argument can be summerized as follows:
  + *Premise*: Motion is inseparable from matter.
  + *Premise*: If motion is inseparable from matter, then motion cannot be transferred without transferring matter.
  + *Premise*: Motion cannot be transferred without transferring matter. [Modus Ponens from 1 & 2]
  + *Premise*: When two bodies collide, no matter is transferred.
  + *Conclusion*: When two bodies collide, no motion is transferred.
The deduction is valid, since she proposed a statement and the inference from that statement, and draw the conclusion using Modus Ponens, which stays consistent. It's a brilliant premise that Cavendish spotted the motion as a property of matter that cannot be separated. The soundness for premise 1 and 4 is ensured by the modern physics. However, the soundness of the argument will be strongly opposed as I will present a rejection, with the help of the conclusion from Cavendish's words, to the conclusion with the following construction:
  + *Premise*: If two bodies collide, they must stop.
  + *Premise*: If everything transfers from moving to stop, then the motion must be transferred, or otherwise it just vanishes out of nowhere.
  + *Premise*: The motion is inseparable from matter, so it vanishes only if the matter vanishes.
  + *Premise*: The matter does not vanish.
  + *Conclusion*: When two bodies collide, the motion is transferred.
The construction of the rejection perhaps is mind-blowing and complex. To further explain it, the premise 3 & 4 gives that the motion will not vanishes out of nowhere, which will used by the intermediate deduction from premise 1 and 2. From premise 1 and 2, it can be easily seen that if two bodies collide, then the motion is either transferred or vanished. The previous conclusion has already provided that the motion will not vanished. Thus, the motion must be transferred. In my humble opinion, the rejection is sound and consistent with the physics experiment, although it did not explain where the motion is transferred to. From today's view, the rejection reflects the conservation of momentum which contradicts with Cavendish's argument, though; her brilliant argument is inovative and thought-provoking, which marks a great contribution on the metaphysics about motion.

= Evaluation on Cavendish's argument for panpsychism
Based on her belief that motion is the essence of every matter in nature, Cavendish also declaimed that the mental property is also the essence of matter @newcastle-2001.
#quote(attribution: [Cavendish, Observations], block: true)[
  That every part has not only sensitive, but also rational matter, is evident, not only by the bare motion in every part of nature, which cannot be without sense, for wheresoever is motion, there's sense; but also by the regular, harmonious, and well-ordered actions of Nature, which clearly demonstrates, that there must need be reason as well as sense, in every part and particle of Nature; for there can be no order, method or harmony, especially such as appears in the actions of Nature, without there be reason to cause that order and harmony.
]
The argument can be expressed as follows:
  + *Premise*: 
  + *Premise*: 
  + *Conclusion*: 


= Evaluation on Malebranche's argument for occasionalism



= Evaluation on Locke's argument against the claim that the idea of God is innate



= Evaluation on Locke's argument for the possibility of thinking matte, along with Astell's response



= Conclusion
#lorem(10)

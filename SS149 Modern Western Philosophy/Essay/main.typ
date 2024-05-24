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
#quote(attribution: [Spinoza, _Ethics_], block: true)[
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
#quote(attribution: [Cavendish, _Observations_], block: true)[
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
Cavendish also proposed a form of panpsychism, declaiming that the consciousness or mental property is also the essence of matter and fundamental in nature @newcastle-2001.
#quote(attribution: [Cavendish, Observations], block: true)[
  How absurd it is to make senseless Corpuscles, the cause of Sense and Reason, and consequently of perception, is obvious to every one's apprehension, and needs no demonstration.
  But I perceive Man has a great spleen against self-moving corporeal Nature, although himself is part of her, and the reason is his Ambition; for he would fain be supreme, and above all other Creatures, as more towards a divine nature; he would be a God, if arguments could make him such, at least God-like, as is evident by his fall, which came merely from an ambitious mind of being like God.
]
The argument can be expressed as follows:
  + *Premise*: Humans have sense and reason.
  + *Premise*: Sense and reason cannot arise from what is senseless and irrational.
  + *Premise*: But humans arise from the ordinary parts of nature.
  + *Conclusion*: The ordinary parts of nature are not senseless and irrational, i.e., everything in nature has sense and reason.
The argument without doubt is valid. Premise 1 is essential assumption of premise 3 even if it can be expressed implictly, and however is declaimed clearly. Premise 3 contradicting the premise 2 arouses a counterargument that the nature has no sense and reason, which is to draw the conclusion. Whatsover, the premise 3 serves as core in the argument but is the weakest point in the argument. A rejection can be proposed as follows. 
#quote(attribution: [More, _A Collection of Philosophical Writing_], block: true)[
  Now I say, the Images of sensible Objects, they spreading to some space in the surface of the Conarion against which they hit, one part of the Conarion has the perception, suppose, of the head of a man, the other of a leg, the third of an arm, the fourth of his breast; and therefore though we should admit that every particle of such a space of the Conarion may perceive such a part of a man, yet there is nothing to perceive the whole man, unless you'l say they communicate their perceptions one to another. But this communication seems impossible; for if Perception be by impression from the external Object, no particle in the Conarion shall perceive any part of the Object but what it receives an impress from. But if you will yet say, that every part of the Object impresses upon every part of the Conarion wherein the Image is, it will be utterly impossible but that the whole Image will be confused, and the distinctness of Colours lost, especially in lesser Objects.
]
The rejection can be constructed as follows:
+ *Premise*: Different parts of the pineal gland perceive different parts of an object, and for the whole object to be perceived, these perceptions must be communicated between the parts.
+ *Premise* 2: Communication of perceptions between different parts of the pineal gland is impossible, and if every part of the object impresses upon every part of the pineal gland, the whole image will be confused and colors will be indistinct.
+ *Conclusion*: Therefore, the pineal gland cannot perceive the whole object clearly and distinctly through impressions from the external object. [Contradiction on 1 & 2]
Henry More didn't explictly argue against the premise 3 from Cavendish, but his perspective critically points out the flaw in premise 3, which is that human cannot arise from the ordinary parts of nature. The interesting thing in the counterargument is that the objector proposed an idea towards the function of the pineal gland in the human brain which we used to perceive the nature, though it has been proved to be wrong by modern brain science. The rejection, if I try to use the ancient perspective, is valid and sound to me. Based on the assumption of dualism between mind and material, if the brain can perceive the nature, then there must be functional part, like a machine, to process the information. Otherwise, the knowledge comes from nowhere, which is absurd and irrational. The functional part in brain is NOT perfect, thus, it cannot simple grasp the whole image of nature, and therefore, is in need of small parts to process seperately, which supports the premise 1. As for the premise 2, if different parts must communicate, then to form the whole image, a final and perfect part is responsible to help with the communication and integration, but in previous sentence, the final part does not exist in brain. Thus, communication is impossible, and premise 2 is sound. Although Cavendish's panpsychism is unsound to me, it offers a unique and innovative perspective on the nature of consciousness and its relationship to the material world and challenges the dualism and mechanism of the time. 

= Evaluation on Malebranche's argument for occasionalism
Nicolas Malebranche proposed his theory that, there's no causation between mental and material. Mental cannot interact directly with matter, it's barely a extend of mind, i.e., only acquires knowledge from the God. In his points, everything has its causation from the God, which is identical to the occasionalism @malebranche-1997. In his argument, he says:
#quote(attribution: [Malebranche, _Search after truth_], block: true)[
  Since the idea we have of all bodies makes us aware that they cannot move themselves, it must be concluded that it is minds which move them. But when we examine our ideas of all finite minds, we do not see any necessary connection between their will and the motion of any body whatsoever. We must therefore also conclude that there is absolutely no mind created that can move a body as a true or principle cause. But when one thinks about the idea of God, i.e., of an infinitely perfect and consequently all-powerful being, one knows there is such a connection between His will and the motion of all bodies, that it is impossible to conceive that He wills a body to be moved and that this body not be moved. The motor force of bodies is therefore not in the bodies that are moved, for this motor force is nothing other than the will of God.
]
The argument can be summerized as follows:
  + *Premise*: God is infinitely perfect and all-powerful.
  + *Premise*: Only the will of God (and not anything in finite minds or bodies) has an a priori necessary connection to the motion of bodies.
  + *Premise*: If there is an a priori necessary connection between A and B, A causes B.
  + *Conclusion*: Only the will of God can cause the motion of bodies.
The argument is valid, but the soundness of the premise 2 can be strongly doubted. By the previous construction of argument for God, the premise 1 is proved to be sound enough. So does premise 3. We can provide the following construction to reject the premise 2: 
  + *Premise*: If God is perfect, then God cannot deceive.
  + *Premise*: If God has every prior connection to the everything in nature, then God is responsible for every evil things.
  + *Premise*: God is infinitely perfect and all-powerful.
  + *Conclusion*: God has no prior connection, i.e., God is not the only cause.
When it comes to promise 2, the statement that ONLY the will of God has a prior necessary connection, implictly blames God for every deceive or other evil things, which contradicts the premise 1 that God is perfect. The counterargument also spotting the consequences in the premise 2, that it raises a significant theological issues which is the basis of his theory. Thus, the rejection is valid and sound. However, I have a suggestion for further rejection, that a more coherent argument is to acknowledge that God set up a self-sustaining natural order, i.e. the rule of nature, instead of through a prior connection or cause to the matter. The order is a more efficient way and thus, the occasionalism is not necessary. The rejection is more convincing to me, as it is more consistent with the modern science and the nature of the world. In modern science, the only motivation for the movement of body is the force, which is the result of natural causation.

= Evaluation on Locke's argument against the claim that the idea of God is innate
To argue against the innate idea of God, John Locke demonstrated his objection to the innate principle from two perspectives @locke-1700.
#quote(attribution: [Locke, _Essay concerning Human Understanding_], block: true)[
  If the Ideas, which made up those Truths, were not [innate], it was impossible that the Propositions made up of them, should be innate, or our Knowledge of them be born with us. For if the Ideas be not innate, there was a time, when the Mind was without those Principles; and then, they will not be innate, but be derived from some other Original.

  That God is to be worshipped, is, without a doubt, as great a Truth as any can enter into the mind of Man, and deserves the first place amongst all practical Principles. But yet, it can by no means be thought innate, unless the Ideas of God, and Worship, are innate. That the Idea, the Term Worship stands for, is not in the Understanding of Children will be easily granted, by any one, that considers how few there be, amongst grown Men, who have a clear and distinct notion of it.
]
His argument can be summerized as follows:
  + *Premise*: If the idea of anything is innate, then it must be learnt at birth of child and thus, without any source of knowledge.
  + *Premise*: The idea of God is derived from some other origin.
  + *Premise*: Children did not know the idea of worship of God
  + *Conclusion*: The idea of God is not innate. [Modus Tollens & Universal Initialization]
The argument is valid, since premise 2 and 3 are conjuncted to form a denial of the inference from premise 1, so by modus tollens, the premise of the inference in premise 1 does not hold. Locke's argument is also sound to me. Premise 1 is the definition or the assumption of the innate idea, while premise 2 & 3 are the common knowledge. However, the soundness of the conclusion is rejected by Leibniz @von-leibniz-1996.
#quote(attribution: [Leibniz, _New Essays on Human Understanding_], block: true)[
  Although the senses are necessary for all our actual knowledge, they are not sufficient to give us all of it, since the senses never give us anything but instances, that is, particular or individual truths. Now all the instances confirming a general truth, however, numerous they may be, are not sufficient to establish the universal necessity of that same truth. As a result it appears that necessary truths, such as we find in pure mathematics and particularly arithmetic and geometry, must have principles whose proof does not depend on instances nor, consequently, on the testimony of the senses.
]
The rejection can be constructed as follows:
  + *Premise*: The senses cannot confer knowledge of necessary truths
  + *Premise*: We have knowledge of necessary truths.
  + *Conclusion*: Therefore, we have knowledge not conferred by the senses.
Leibniz emphasized the existence of foreknowledge of necessary truths. However, the argument for premise 2 is vulnerable, as it barely points out that the necessary truth is already there in nature, rather than arguing that the truth is already put in our mind before the birth. Therefore, though the counterargument is valid and premise 1 is sound, the most important and controversial part, premise 2, does not hold. For instance in Leibniz's words, if truths in mathematics and geometry is already possessed by us, then why we need to attend the class and learn them? Is the knowledge of them already learnt as the innate idea? Thus, the rejection is not sound to me, and Locke's argument is still valid and sound to me.

= Evaluation on Locke's argument for the possibility of thinking matte, along with Astell's response



= Conclusion
Our exploration of the philosophical debates of the Early Modern period reveals a profound evolution in thought that continues to influence contemporary philosophy. The arguments of Descartes, Spinoza, Cavendish, and Locke each contribute uniquely to our understanding of knowledge, reality, and causality. Descartes' wax argument questions sensory perception's reliability, while Spinoza's critique of final causes redefines purpose and causation. Cavendish's materialist propositions challenge Cartesian dualism, and Locke's inquiry into the nature of thought and matter invites ongoing debate. Critically evaluating these arguments not only honors the intellectual legacy of these philosophers but also allows us to refine and adapt their ideas to our current understanding. By standing on the shoulders of these giants, we are equipped to see further, recognizing the enduring relevance of their insights and the necessity of revisiting and revising their theories in light of new knowledge and perspectives.

#import "@preview/ssrn-scribe:0.4.9": *

#show: paper.with(
  font: "CM Roman",
  fontsize: 12pt,
  maketitle: true,
  title: [Critical Evaluation on the Discourse about the Final Causes],
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
    In the final essay, we will critically explore the discourse on final causation between Spinoza and Leibniz, one key philosophical arugument and the opponent from the early modern period in the $17^"th"$ century. For the argument proposed, we will present in premise-conclusion form briefly, and then critically examine the validity and soundness of them. Finally, the reconstruction and opponents will be following. Through the evaluation of the argument and counterargument, we aim to provide a deeper understanding of the philosophical thinking of the final causes and the nature of causation in the early modern period.
  ],
  keywords: [
    Spinoza,
    Leibniz,
    Final Causation,
    Analytic Philosophy],
  bibliography: bibliography("ref.bib", title: "References", style: "apa"),
)

#set enum(indent: 2em)
= Introduction
The discourse delves into the heart of philosophical debates that marked the Early Modern period, a time of revolutionary thought that challenged established norms and laid the groundwork for our contemporary prospective of the world. Spinoza's critique of final causes redefines the ancient understanding of purpose and cause in nature. Though it might be thought to be blasphemous, the objection from Spinoza is brilliant and innovative enough to enrich the diversity and depth in the philosophy back then. However, the counterargument from Leibniz defends himself effectively as well, although he did not attack on either premises of Spinoza's. It's not fair to criticize former arguments, as we're standing on the giant's shoulder to see further than our ancients. However, we are still capable to evaluate their arguments and see if they are still valid in the contemporary world. If not, we'd like to propose some modifications to make them more convincing. Knowing the reason for the flaws in their thoughts can also help us gain a deeper understanding of the world and the nature of knowledge.

= Evaluation on Spinoza's argument against final causes
To argue against the teleology, Spinoza provides two convincing argument to defend himself @spinoza-2002.
#quote(attribution: [Spinoza, _Ethics_], block: true)[
  Not many words will be required now to show that Nature has no end set before it, and that all final causes are nothing but human fictions. For I believe I have already sufficiently established it, both by the foundations and causes from which I have shown this prejudice to have had its origin, and also by P16, P32C1 and C2, and all those [propositions] by which I have shown that all things proceed by a certain eternal necessity of nature, and with the greatest perfection. Again, this doctrine takes away God's perfection. For if God acts for the sake of an end, he necessarily wants something which he lacks.
]
To construct his argument, we can write it as follows:
  + *Premise*: We know that everything proceeds by a certain eternal necessity of nature with the greatest perfection.
  + *Premise*: If there are final causes, then we do not know everything proceeds by a certain eternal necessity of nature with the greatest perfection.
  + *Premise*: If God acts for the sake of an end, he necessarily wants something which he lacks.
  + *Conclusion*: God cannot act for the sake of an end, and there are no final causes.
The validity of the argument is without doubt to be ensured. As for the soundness, in the first argument [Premise 1 & 2], Spinoza argues that attributing final causes to nature is a projection of human psychology onto the natural world. Humans often ascribe purposes to natural events because they tend to understand things in terms of their own goals and purposes. This anthropomorphic view leads to the mistaken belief that nature acts with ends in mind, just as humans do.

According to Spinoza [Premise 3], nature does not act according to a plan or for the sake of achieving specific outcomes. Natural events are the result of the immutable laws of nature, not the pursuit of particular goals. The concept of final causes suggests that nature has preferences or intentions, which Spinoza denies.

= Evaluation on Leibniz's argument for final causes
However, Leibniz, in his works, provides a nuanced response to Spinoza's rejection of final causes. While he agrees with Spinoza on the importance of understanding natural phenomena through efficient causes, he does not dismiss final causes altogether. To solidate his arguments, he provides his points from two aspect, theologically @von-leibniz-1968 and scientifically @leibniz-2022. Leibniz's theological argument is summerized as follows:
  + *Premise*: If God exists, then the world was created by a mind who aims at the good.
  + *Premise*: If the world was created by a mind who aims at the good, then there are (transcendent) final causes.
  + *Conclusion*: There are (transcendent) final causes.
and along with the scientific argument:
  + *Premise*: If scientific laws are demonstrated from the principle of perfection and order, then there must be a final cause
  + *Premise*: The laws are demonstrated from the principle of perfection and order.
  + *Conclusion*: There must be a final cause
Leibniz does not see teleology as a mere projection of human psychology onto nature. Instead, he believes that purpose and design are inherent in the structure of the universe. He sees evidence of this in the intricate and harmonious relationships between different parts of nature, suggesting a purposeful order rather than random or indifferent processes. Thus, the theological argument [Premise 2] points out that, everything designed perfectly by God, there must be a start and an end, or in other words, everything started aims at end for the good.

Leibniz also argues that God, being omniscient and perfect, has designed the world in the best way, meaning that everything in the world serves a purpose within the grand design. From his observation, the principle of nature will cause everything to dead, which he thinks is well organized. Thus, since the world is operating with the perfect and ordered principles of nature, designed by God, everything that follows the laws will eventually comes to an end, instead of eternality. This view contrasts with Spinoza's more deterministic and impersonal view of nature.

= Critique on the Spinoza-Leibniz debate
From my perspective, I find Spinoza's argument more convincing. Though modern science like biology finds that organisms operate on a mechanism of aging and self-destructing, which supports the teleology. The truth lies beneath the surface, that the cells, basic units of life, are designed to live forever by splitting and reproducting. Aging is barely a intermediate state of the eternal life. People tends to think the world will terminate due to the fact that everyone will be facing the death. However, the perspective can be simply restricted, letting us to view the nature indifferent as human being, for which I prefer to argue that the nature, whether the God exists or not, will operate without any purposes and straightly follows the rules. Thus, although, the teleology is well supported by the phenomenem of the nature, at least for the time being with current knowledge, the argument from Spinoza is still valid and sound to me.

= Conclusion
Our exploration of the philosophical debate of the Early Modern period reveals a profound evolution in thought that continues to influence contemporary philosophy. The arguments of Spinoza's critique of final causes redefines purpose and causation of the nature, while Leibniz insists on the mainstream view of theology, proposing his argument to defend for the final cause. Critically evaluating these arguments not only honors the intellectual legacy of these philosophers but also allows us to refine and adapt their ideas to our current understanding, without which we cannot have the view of the world as we have today.

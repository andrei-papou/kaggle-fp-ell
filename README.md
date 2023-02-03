## FP-ELL Competition Solution

27-th place solution of [Feedback Prize - English Language Learning](https://www.kaggle.com/competitions/feedback-prize-english-language-learning)

Most of the notebooks use [kaggle-toolbox](https://github.com/andrei-papou/kaggle-toolbox) library under the hood.

### Short summary

The key idea of the solution is to use single target models instead of the multi-target one. While generally fitting a multi-target model is a good idea, experiments clearly show that the single-target ones perform significatly better. Possible explanation is a high correlation between the targets combined with a huge difference in the task complexity.

// import 'package:cloud_firestore/cloud_firestore.dart';

// class ProjectsManager {
//   final _store = FirebaseFirestore.instance;
//   Stream getProjectsFromFirebase() {
//     // Stream<QuerySnapshot<Map<String, dynamic>>> x = _store.collection('skillsDB').snapshots() as Map;
//     var x = _store.collection('projectsDB').snapshots();
//     return x;
//   }
// }

import 'package:portfolio/models/projectsModel.dart';

class ProjectsManager {
  final List<ProjectModel> projects = [
    ProjectModel(
      name: 'MNIST Classifier',
      desc:
          'A convolutional neural network that classifies handwritten digits from MNIST dataset.',
      githubLink: '.',
      projectIconURL: 'assets/projects/MNIST.jpeg',
      toolsUsed: ['Python', 'PyTorch', 'NumPy', 'Matplotlib'],
      availablePlatforms: [],
      tags: ['Machine Learning', 'Deep Learning', 'CNN'],
      features: [
        'Implemented a convolutional neural network (CNN) architecture to classify handwritten digits from the MNIST dataset.',
        'Achieved an accuracy of 98% on the test set after training the model for 10 epochs.',
        'Utilized data augmentation techniques to improve model generalization and prevent overfitting.',
        'Visualized training progress and results using Matplotlib, including loss and accuracy curves.'
      ],
      rotateIcon: true,
      projectIlltURL: 'assets/projects/MNIST_illt.jpeg',
    ),
    ProjectModel(
      name: 'Pneumonia Detection CNN',
      desc: 'Detecting Pneumonia after analysing chest X-ray images',
      githubLink: 'githubLink',
      projectIconURL: 'assets/projects/Pneumonia.jpeg',
      toolsUsed: ['Python', 'PyTorch', 'Matplotlib'],
      availablePlatforms: [],
      tags: ['CNN', 'Machine Learning', 'Deep Learning'],
      features: [
        'Developed a Convolutional Neural Network (CNN) using PyTorch to classify pneumonia from ~5,800 chest X-ray images, focusing on challenges specific to medical imaging datasets.',
        'Addressed performance bottlenecks by applying image augmentation, batch normalization, threshold tuning, dropout, and analysing the effects of class imbalance on the final accuracy.',
        'valuated model performance using ROC-AUC and Recall instead of accuracy alone, recognizing the importance of minimizing false negatives in medical datasets. Final Recall score of 1.00, ROC-AUC of 1.00, and accuracy of ~75%.',
      ],
      rotateIcon: true,
      projectIlltURL: 'assets/projects/Pneumonia_illt.png',
    ),
    ProjectModel(
      name: 'KickFlip',
      desc: 'An online marketplace for sneaker enthusiasts',
      githubLink: 'githubLink',
      projectIconURL: 'assets/projects/KickFlip.png',
      toolsUsed: ['Flutter', 'Firebase', 'Rest APIs'],
      availablePlatforms: ['Android', 'iOS'],
      tags: ['E-commerce', 'Marketplace', 'Sneaker Reselling'],
      features: [
        'Designed a mobile application using Flutter that serves as an online marketplace for sneaker enthusiasts, allowing buyers and sellers to connect and conduct purchases with ease.',
        'Establised an auction system to respect demand and supply based pricing.',
        'Implemented mechanism for product verification prior to listing to ensure customer\'s interests are protected.',
      ],
      rotateIcon: false,
      projectIlltURL: 'assets/projects/KickFlip_illt.jpg',
    ),
    ProjectModel(
      name: 'Employee Churn Neural Network',
      desc:
          'Created an employee churn neural network from scratch, no Tensorflow or PyTorch - just math and logic',
      githubLink: 'githubLink',
      projectIconURL: 'assets/projects/EmployeeChurn.jpeg',
      toolsUsed: [
        'Python',
        'NumPy',
        'Linear Algebra',
        'Calculus',
        'Matplotlib'
      ],
      availablePlatforms: [],
      tags: ['Neural Networks', 'Machine Learning Fundamentals'],
      features: [
        'Implemented a binary classification neural network from scratch using NumPy and Python on an employee churndataset of 5000 records and 22 features.',
        'Focused on core ML concepts like backpropagation, loss functions, activation functions, gradient descent, and more.',
        'Optimized the network for an accuracy of ~93.7%.'
      ],
      rotateIcon: true,
      projectIlltURL: 'assets/projects/EmployeeChurn_illt.jpeg',
    ),
  ];
}

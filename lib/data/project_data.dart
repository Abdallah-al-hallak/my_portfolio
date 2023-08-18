import 'package:portfolio/data/model/projects_model.dart';

class ProjectsData {
  List<ProjectsModel> project = [
    const ProjectsModel(
      projectName: 'Asl',
      description:
          'POS system app Linked with asl website for managing the work of sailing, prints vouchers and shifts, works offline and online. integrated with giedia Payments to pay with your card. ',
      photo1: 'assets/imgs/selling.png',
      photo2: 'assets/imgs/product.png',
      photo3: 'assets/imgs/Details.png',
    ),
    const ProjectsModel(
      projectName: 'CRS',
      description:
          'Car Repairing System Linked with website, the provides with information for your car, and allows you to see the progress with it.',
      photo1: 'assets/imgs/car1.jpg',
      photo2: 'assets/imgs/car2.jpg',
      photo3: 'assets/imgs/car3.jpg',
    ),
    const ProjectsModel(
      projectName: 'PDA',
      description:
          'POS app for small businesses, you can print vouchers and and mounthly reports, works only offline to deliver speed for your needs.',
      photo1: 'assets/imgs/pda1.jpg',
      photo2: 'assets/imgs/pda2.jpg',
      photo3: 'assets/imgs/pda3.jpg',
    ),
    const ProjectsModel(
      projectName: 'GSS',
      description:
          'Gas Station app. this app helps the owner of gas station to see the how much oil left in the pumps, also give reports. ',
      photo1: 'assets/imgs/gss1.jpg',
      photo2: 'assets/imgs/gss2.jpg',
      photo3: 'assets/imgs/gss3.jpg',
    ),
  ];
}

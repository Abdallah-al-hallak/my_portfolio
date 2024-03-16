import 'package:portfolio/data/model/projects_model.dart';

class ProjectsData {
  List<ProjectsModel> project = [
    const ProjectsModel(
      projectName: 'Asl',
      description:
          'This project involves developing a POS (Point of Sale) system application that integrates with an ASL website to streamline sales management. It facilitates voucher printing and shift management, offering both online and offline functionality. Additionally, the app is integrated with Giedia Payments, allowing users to make payments using their cards. ',
      photo1: 'assets/projects/asl.png',
      photo2: 'assets/imgs/google.svg',
      photo3: '',
      googleLink:
          'https://play.google.com/store/apps/details?id=com.asal_mobile',
      storeLink: '',
    ),
    const ProjectsModel(
      projectName: 'Etloob',
      description:
          'Etloob is an e-commerce app and delivery service. Dedicated to simplifying your life.',
      photo1: 'assets/projects/etlooblogo.png',
      photo2: 'assets/imgs/google.svg',
      photo3: 'assets/imgs/appstore.svg',
      googleLink: 'https://play.google.com/store/apps/details?id=com.etloob',
      storeLink: '',
    ),
    const ProjectsModel(
      projectName: 'Etloob vendor',
      description:
          'An application for vendors in Etloob Application to manage their stores and track sales with ease.',
      photo1: 'assets/projects/appLogo1024.png',
      photo2: 'assets/imgs/google.svg',
      photo3: 'assets/imgs/appstore.svg',
      googleLink:
          'https://play.google.com/store/apps/details?id=com.etloob.vendor',
      storeLink: '',
    ),
    const ProjectsModel(
      projectName: 'CRS',
      description:
          'Car Repairing System Linked with website, the provides with information for your car, and allows you to see the progress with it.',
      photo1: 'assets/projects/crs.png',
      photo2: 'assets/imgs/google.svg',
      photo3: '',
      googleLink:
          'https://play.google.com/store/apps/details?id=com.carmaintenance.car',
      storeLink: '',
    ),
    const ProjectsModel(
      projectName: 'PDA',
      description:
          'POS app for small businesses, you can print vouchers and and mounthly reports, works only offline to deliver speed for your needs.',
      photo1: 'assets/projects/PDA.png',
      photo2: '',
      photo3: 'assets/imgs/pda3.jpg',
      googleLink: '',
      storeLink: '',
    ),
    // const ProjectsModel(
    //   projectName: 'GSS',
    //   description:
    //       'Gas Station app. this app helps the owner of gas station to see the how much oil left in the pumps, also give reports. ',
    //   photo1: 'assets/projects/etloob.png',
    //   photo2: 'assets/imgs/gss2.jpg',
    //   photo3: 'assets/imgs/gss3.jpg',
    //   googleLink: '',
    //   storeLink: '',
    // ),
  ];
}

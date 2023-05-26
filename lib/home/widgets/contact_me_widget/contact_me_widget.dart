import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeWidget extends StatefulWidget {
  const ContactMeWidget({super.key});

  @override
  State<ContactMeWidget> createState() => _ContactMeWidgetState();
}

class _ContactMeWidgetState extends State<ContactMeWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          height: size.height,
          child: Column(
            children: [
              // SizedBox(width: 0.0, height: 20.0),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/imgs/spider.png',
                    fit: BoxFit.cover,
                    width: size.width,
                    height: size.height / 1.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const ContactRow(
                        desc: ' 0934686413',
                        img: 'assets/imgs/whats.png',
                      ),
                      const SizedBox(width: 0.0, height: 20.0),
                      const ContactRow(
                        isUrl: true,
                        desc: 'linkedin.com/in/abdallah-al-hallak',
                        img: 'assets/imgs/linkedin.png',
                      ),
                      const SizedBox(width: 0.0, height: 20.0),
                      const ContactRow(
                        desc: 'abdallahalhallak1@gmail.com',
                        img: 'assets/imgs/email.png',
                      ),
                      const SizedBox(width: 0.0, height: 20.0),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const ContactMeText(
                            text: 'Thank You',
                          ),
                          Container(
                            width: 250,
                            height: 0.5,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ContactRow extends StatefulWidget {
  const ContactRow({
    super.key,
    required this.desc,
    required this.img,
    this.isUrl = false,
  });
  final String img;
  final String desc;
  final bool? isUrl;

  @override
  State<ContactRow> createState() => _ContactRowState();
}

class _ContactRowState extends State<ContactRow> {
  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse('https://${widget.desc}');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            widget.img,
            width: 40,
          ),
          const SizedBox(width: 30.0, height: 0.0),
          InkWell(
            onTap: widget.isUrl!
                ? () async {
                    await _launchUrl();
                  }
                : null,
            child: ContactMeText(
              text: widget.desc,
            ),
          ),
        ],
      ),
    );
  }
}

class ContactMeText extends StatelessWidget {
  const ContactMeText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
}

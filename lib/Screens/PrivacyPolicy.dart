import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/constants.dart';

class Privacy extends StatefulWidget {
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
          );
        },
      ),
    );
  }

  @override
  _PrivacyState createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Privacy Policy',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'KONDA (www.konda.co.in ). The Domain & Server Authenticator, KONDA is only the server authenticator of India. That will full of control to the unauthorized organization, company, government activity or even individual. Before bring or purchase any domain name, host id, server name, Company profile name. They must have to take permission from the KONDA.We have unique encoded semi-trance gateway \n this gateway administration must have to go through KONDA. That will redirect your request from any server name, or even domain name provider company. User can directly put own requirement on any domain provider thereafter they must have to send the link for the authentication to the KONDA. KONDA is a Product of BUGS Soft-Tech Private Limited. That is authorizing by Ministry of Corporate Affairs, India (Asia). ',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Abstraction: In the sector of Information Technology. Cyber-crime is hiking day by day there is not have anyone to control and authenticate them. Mostly educated people want to know details about any company, organization, individual person they do mostly use internet but why? Because they want to same own valuable time, they trust to the internet, they believe in the internet surely have right information but they were wrong. The demands of internet growing every day that is excellent that’s why KONDA have launches semi trance authentication techniques using full of rights.\nTo carry on the business of Software designing, development, customization, implementation, maintenance, testing and benchmarking, designing, developing and dealing in computer software and solutions, and to import, export, sell, purchase, distribute, host (in data centers or over the web) or otherwise deal in own and third party computer software packages, programs and solutions, and to provide internet / web based applications, services and solutions, provide or take up Information technology related assignments on sub-contracting basis, offering services on-site/ offsite or through development centers using owned /hired or third party infrastructure and equipment.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Key: KONDA, Ministry of Corporate Affairs, Cyber-Crime Department of India, CSS, PhP, .Net Frameworks, Java, JavaScript’s, HTML, My SQL Server, OSI Layers, Semi-Hybrid TCP-IP & UDP. AI, IT-Channels, Datagram’s Protocols, KONDA Base Server, Turnery VAIDYA, Python, C, C++, C# , etc. Back end Security.\nBUGS TECHNOLOGY built the Konda app as a Free app. This SERVICE is provided by BUGS TECHNOLOGY at no cost and is intended for use as is.\nThis page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\nIf you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\nThe terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Konda unless otherwise defined in this Privacy Policy.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Konda Technology',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'A cloud system or cloud computing technology refers to the computing components (hardware, software and infrastructure) that enable the delivery of cloud computing services such as: SaaS (software as a service), PaaS (platform as a service) and IaaS (infrastructure as service) via a network (i.e. the Internet). A cloud system access computing services (CSACS) use web browsers. A KONDA represent a computing model that shifts the computing workload to a remote location. Internet based email applications are a prime example of a cloud system that provides a platform for the delivery electronic messaging services. Cloud computing is also sometimes referred to as utility computing, since consumer usage of cloud systems is metered and billed in a manner similar to a commodity like water or electric services.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hardware Support',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'There are two key elements at the core of cloud computing technology, which are: SOA (Service Oriented Architecture) and cloud virtualization, which are described in further detail below:-\nSOA Architecture – this element of cloud technology allows organizations to access cloud based computing solutions with features that can be modified on demand, as business needs change. Service Oriented Architecture allows independent web services to communicate with each other via the Internet in real time, providing the flexibility that is required to rapidly reconfigure the service delivery for a specific cloud computing offering.\nSOA places the responsibility and costs of development, deployment and maintenance of web service components on the web services provider, which allows a web services consumer to access various web services without the expense or overhead that is associated with traditional methods of IT services delivery. SOA is a powerful technological component of cloud computing because it facilitates centralized distribution and component reuse, which significantly drives down the cost of software development and delivery.\nCloud Virtualization is another important aspect of a cloud system that facilitates the efficient delivery of cloud computing services. The implementation of virtual computing resources in the cloud, that mimic the functionality of physical computing resources, serves as a flexible load balancing management tool that allows for the swift adjustment of computing services delivery on demand. Virtualization technology provides organizations with a tool that promotes high levels of availability, scalability and reliability; in terms of the cloud systems or cloud computing technology that an enterprise can access to meet its information technology needs. Virtualization is also a very important component of cloud computing technology for the purposes of disaster recovery and fail-over support.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Software Support',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Software platforms delivered as services can be divided in two tiers of varying scale:\nIaaS (Infrastructure as a Service)\nPaaS (Platform as a Service)\nGenerally speaking, IaaS is more comprehensive, including integration down to the hardware level, whereas PaaS is mostly concerned with software interfacing.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Platform As A Service',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'PaaS, or solution stack, offers a more comprehensive approach to the cost effective application deployment need of today’s developers. This service provides the necessary hardware architecture and software framework needed to put an application into service, without having to own, manage and upkeep all the required resources.\nResponsibility of data maintaining, upgrading, data storing, helper applications and system operating fall into the developer’s hands. Compared to IaaS, the PaaS offers complete solutions for the design, creation, testing and deployment of the client’s application combined with team member’s connectivity, software configuration management, version control, integration of databases and customer web service. Taking things a step further, Appended offers all of the above-mentioned elements in a high data security environment for enterprises.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Infrastucture As A Service',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'IaaS, in comparison to the PaaS, provides equipment for operations, networking, data storage and hardware with the use of the internet; so that the subscriber is no longer confronted with location and purchase costs. The provider of these computing resources has only the responsibilities of maintaining the hardware running and housing all the devices. In return, the client will pay strictly for the use of the hardware or hardware related services that were accessed. This kind of solution will offer the client the possibility to acquire server/network resources instantly without taking up any space.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Algorithms:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Cloud infrastructure services, known as “Infrastructure as a Service” (IaaS), deliver computer infrastructure, storage, and networking. Infrastructure as a Service refers to a combination of hosting, hardware, provisioning, and the basic services needed to run a cloud. Using IaaS, an organization can outsource the equipment used to support operations, including storage, hardware, servers, and networking components.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IAAS SOFTWARE AND IAAS SERVICES',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'With Infrastructure as a Service, users gain an infrastructure on top of which they can install any required platforms. IaaS services provide a cost-effective and flexible solution, allowing businesses to minimize their use of internal IT resources. Application integration tools, made available using the self-service model, can be configured, deployed and managed from a web browser or similar interface without requiring the on-premises installation of software or hardware. Companies that have multiple organizations can use the multi-tenant approach to isolate respective business units while maintaining their control of the system.\nOrganizations that opt to use IaaS often have considerable in-house IT skills. IaaS software clients select basic software servers for their part of the cloud, load their libraries, applications, and data, and then configure them themselves. Vendors manage virtualization, servers, hard drives, storage, and networking, while IaaS users maintain the management of applications, data, runtime, middleware, and O/S.\nVirtualization allows IaaS providers to offer nearly unlimited instances of servers to clients and to increase the cost-effectiveness of hosting hardware. Using IaaS software, organizations can rapidly build new versions of environments or applications without the need to order and configure new hardware. Many organizations also use IaaS to host their websites; providers take charge of keeping the site available and monitoring traffic, while the IaaS services allow clients to prevent the website from draining the IT resources of their internal infrastructure.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Data Flow Diagram',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'How to Build a Private Cloud\nIf you’re nervous about running your business applications on a public cloud, many experts recommend that you opt for a private cloud instead. But building a private cloud within your data center is not just another infrastructure project.\nAn internal, on-premise private cloud begins with data center consolidation, rationalization of OS, hardware and software platforms, and virtualization up and down the stack servers, storage, and network. Elasticity and pay-as-you-go pricing are guiding principles that allow for the standardization, automation, and commoditization of IT. But it goes beyond infrastructure and provisioning resources.\nIt’s also about application building and the user’s experience with IT. Despite all the hype, internal clouds are still at an early stage. Only 5% of large enterprises are even capable of running an internal cloud, and only about half of those actually do. If you’re interested in being at the forefront of this movement, here’s what you need to know about how to build a private cloud.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'FIRST STEPS: \nSTANDARDIZATION, \nAUTOMATION, \nSHARED RESOURCES',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'To go forward with building private cloud on-premises, you must have standardized and documented procedures for operating, deploying, and maintaining that cloud environment. Standardized operating procedures that allow efficiency and consistency are critical for automation, which enables self-service capabilities. In terms of the private cloud, self-service means that an enterprise has established an automated workflow whereby resource requests go through an approvals process.\nOnce approved, the cloud platform automatically deploys the specified environment. Depending on their needs, developers typically specify the parameters for VMs, storage volume, and bandwidth.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'UNDERSTAND YOUR SERVICES',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Many enterprises misguidedly think about building a private cloud from a product perspective before they consider services and service requirements, but services need to be considered first. Whether a workload has affinity with a private, public, or hybrid model depends on a number of attributes, including obvious ones like compliance and security but also things like latency and interdependencies of components in applications.\nIf you’re going to commit to building a private cloud, you need to know what your services are, and what the service-level agreements, costs, and road maps are for each of those. Common services with relatively static interfaces, even if your business is highly reliant on them, are those you should be considering for cloud-style computing. E-mail is one example: You may use it frequently, but instead of wanting it to be integrated tightly with the company, you want to make it as separate as possible, easy to use, and available from self-service interface. If you’ve customized this type of service over time, you’ve got to make it as standard as possible. Once you understand which services are right for the cloud and how long it will take to get them to a public-readiness state, you’ll be ready to start to look at building a private cloud from a technology perspective',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'FOUR TIERS OF COMPONENTS FOR BUILDING A PRIVATE CLOUD',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'First of the resource tier comprising infrastructure, platforms, software. Raw virtualization comes to mind immediately. Rapid re-provisioning technology is another option. Above the resource pool sits the resource management tier, where the pool is managed in an automated manner.\nThese two levels are fairly mature. Next the service management tier. Here you want something that lets you do service governance and convert pools of resources into service levels. You ultimately need to be able to present to the user some kind of service-level interface that says “performance” or “availability” and have the services management tier delivering on that.\nSitting atop it all is the access management tier, which is all about the user self-service interface. It presents a service catalog, gives users all the knobs to turn, and lets you manage subscribers. The interface has to be tied in some way to costing and chargeback, or at least metering”? At that level, it ties to the service management tier.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'IT’S ALL ABOUT THE BUSINESS',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'While building a private cloud means you need to think in terms of elasticity, automation, self-service, and chargeback, you shouldn’t be too rigid about the distinctions at this stage of cloud’s evolution. You might get to SaaS eventually, and in the meantime do as much automation as you can, introducing concepts slowly so your organization has time to adapt to the cloud model. The bottom line is, you have to think about the value the cloud will bring to your organization. Cloud platform providers such as Appended have been noted for their ability to make multi-tenancy fewer complexes, to make architecture more mature, and to allow businesses to direct their energy toward efficiency and innovation.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Authenticated Architecture',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Policies and Safety:- \nWhen you use KONDA, you join a community of people from all over the world. Every cool, new community feature on KONDA involves a certain level of trust. All of users respect that trust and we trust you to be responsible too. Following the guidelines below helps to keep KONDA fun, learn, educated, news and enjoyable for everyone. KONDA is only the products that containing lots of features in a single windows. If found any kinds of unauthenticated issues, fraudulent, theft, data crash (user), or any other personal information shares with closely known people they (user) only will responsible. We are 90% responsible to protect your data remaining average depends upon server, user or other anti-theft issue.\nYou might not like everything you see on KONDA. If you think content is inappropriate, use the flagging feature to submit it for review by our KONDA staff. Our staff carefully reviews flagged content 24 hours a day, 7 days a week to determine whether there’s a violation of our Community Guidelines.\nHere are some common-sense rules that ll help you steer clear of trouble. Please take these rules seriously and take them to heart. Dont try to look for loopholes or try to lawyer your way around the guidelines—just understand them and try to respect the spirit in which they were created.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nudity or sexual content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'KONDA is not for pornography or sexually explicit content. If this describes your video, even if its a video of yourself, dont post it on KONDA. Also, be advised that we work closely with law enforcement and we report child exploitation.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Harmful or dangerous content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Dont post videos that encourage others to do things that might cause them to get badly hurt, especially kids. Videos showing such harmful or dangerous acts may get age-restricted or removed depending on their severity.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Hateful content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Our products are platforms for free expression. But we dont support content that promotes or condones violence against individuals or groups based on race or ethnic origin, religion, disability, gender, age, nationality, veteran status, caste, sexual orientation, or gender identity, or content that incites hatred on the basis of these core characteristics.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Violent or graphic content',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Its not okay to post violent or gory content thats primarily intended to be shocking, sensational, or gratuitous. If posting graphic content in a news or documentary context, please be mindful to provide enough information to help people understand whats going on in the video. Dont encourage others to commit specific acts of violence.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Harassment and cyber bullying',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'It’s not ok to post abusive videos and comments on KONDA. If harassment crosses the line into a malicious attack it can be reported and may be removed. In other cases, users may be mildly annoying or petty and should be ignored.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Spam, misleading metadata, and scams',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Everyone hates spam. Dont create misleading descriptions, tags, titles, or thumbnails in order to increase views. Its not okay to post large amounts of untargeted, unwanted or repetitive content, including comments and private messages.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Threats',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Things like predatory behavior, stalking, threats, harassment, intimidation, invading privacy, revealing other peoples personal information, and inciting others to commit violent acts or to violate the Terms of Use are taken very seriously. Anyone caught doing these things may be permanently banned from KONDA',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Copyright',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Respect copyright. Only upload videos that you made or that you are authorized to use. This means dont upload videos you didnt make, or use content in your videos that someone else owns the copyright to, such as music tracks, snippets of copyrighted programs, or videos made by other users, without necessary authorizations. Visit our Copyright Center for more information.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Privacy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'If someone has posted your personal information or uploaded a video of you without your consent, you can request removal of content based on our Privacy Guidelines.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Impersonation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Accounts that are established to impersonate another channel or individual may be removed under our impersonation policy.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Child Safety',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Learn about how we protect minors in the KONDA ecosystem. Also, be advised that we work closely with law enforcement and we report child endangerment.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Additional policies',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'If a KONDA creator’s on- and/or off-platform behavior harms our users, community, employees or ecosystem, we may respond based on a number of factors including, but not limited to, the egregiousness of their actions and whether a pattern of harmful behavior exists.\nOur response will range from suspending a creator’s privileges to account termination.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Teen safety',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Here are some useful tools and friendly tips for staying safe on KONDA.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Restricted mode',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Screen out potentially objectionable content that you or your family may not want see.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Suicide and self-injury',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'You’re not alone. Need support? For free, confidential 24/7 support in the INDIA, call the National Suicide Prevention Lifeline: 091529 87821.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Educator Resources',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Here are some resources to help empower you and your students to stay safe online.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Parent Resources',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Tools and resources to help you manage your family’s experience on KONDA.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Privacy and safety settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Quick access to privacy and safety settings.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Legal policies',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Learn about reporting content on KONDA and how we enforce our Community Guidelines',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'VAiDYA Homeo:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Learn about reporting content on KONDA and how we enforce our Community Guidelines.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Report a video',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'When, why and how to flag content.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Report a legal complaint',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Directly file a report here',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Report a privacy violation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Let us know if videos or comments on the site violate your privacy or sense of safety.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Other reporting options',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'When flagging a video does not accurately capture your issue?',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Age Restrictions',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Sometimes a video doesnt violate our guidelines, but might not be appropriate for everyone so may be age-restricted.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Community Guidelines strikes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'What they are and how we handle them.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Account terminations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Serious or repeated violations Community Guidelines violations can lead to account termination',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Appealing video strikes',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'What to do if you get a strike.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'License/Legal/Trademark',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Using someone else trademark in a username, tags, or the title of your video does not necessarily constitute infringement. However, if there is content on your profile or video that would confuse viewers into believing that the trademark owner created or sponsors your page or content, then the trademark owners rights may be infringed. In these cases, we may remove the content in question, so its important to be sensitive to other peoples trademark rights when choosing a username or adding metadata to your videos.\nIf you were a trademark owner and you believe your trademark is being infringed, please note that KONDA is not in a position to mediate trademark disputes between creators and trademark owners. As a result, we strongly encourage trademark owners to resolve their disputes directly with the creator who posted the content in question. Contacting the up loader may help quickly resolve your claim. Trademark owners can contact the creator or you can submit a complaint directly to the up loader through our Trademark Complaint form.\nSome creators list ways they can be contacted in their channel. Learn more about how to get in touch with others here.\nIf you cant reach a resolution with the account holder in question, please submit a trademark claim through our Trademark Complaint form. KONDA is willing to perform a limited investigation of reasonable complaints and will remove content in cases of clear infringement.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Defamation',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'If you or your legal representative believes that content hosted on KONDA is defamatory, please visit our online web form, where you can submit a complaint.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Counterfeit',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Google prohibits the sale or promotion of counterfeit goods in its products, including KONDA. Counterfeit goods contain a trademark or logo that is identical to or substantially indistinguishable from the trademark of another. They mimic the brand features of the product in an attempt to pass themselves off as a genuine product of the brand owner, or they promote the goods as faux, replicas, imitations, or clones of the original product.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Reporting counterfeit goods:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'If you believe that a KONDA video or comment is selling or promoting counterfeit goods, you may file a counterfeit complaint through our web form. Our team will investigate your complaint and if the content violates Google counterfeit policy, we will remove it.',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Benefits:',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'KONDA Partner Program Basics\nKONDA Partner Program overview & eligibility\nMy channel is approved to monetize FAQs\nMy channel was rejected for monetization FAQs\nHow to earn money on KONDA\nPolicies & eligibility\nKONDA channel monetization policies\nAdvertiser-friendly content guidelines\nRate your content with Self-Certification\nUpcoming and recent ad guideline updates\nStrikes\nChanges to account standing\nCommunity Guidelines strike basics\nAppeal Community Guidelines actions\nCopyright strike basics\nWhat you can monetize & how\nWhat kind of content can I monetize?\nChoose how you want to monetize\nUnderstand your earnings\nKONDA partner earnings overview\nSee your earnings\nMyth busting the KONDA Partner Program\n“Limited or no ads” explained\nSearch & Discovery and monetization FAQs\nMonetization systems or ‘the ads algorithm’ explained\nHow advertiser-friendly monetization reviews work',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Account terminations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Serious or repeated violations Community Guidelines violations can lead to account termination',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

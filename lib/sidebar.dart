import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:2,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset("assets/Adstacks.png" , height: 60),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10 ),
                child: Divider( color: Colors.grey, thickness: 2,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15 , 0 , 5),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(radius: 40,
                    backgroundImage: AssetImage("assets/Pooja.jpg"),),
                ),
              ),
              Text("Pooja Mishra" , style: TextStyle(fontWeight: FontWeight.bold),),
              Padding(
                padding: const EdgeInsets.all(10),
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey, width: 2),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: const Text("  Admin  "),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10 ),
                child: Divider( color: Colors.grey, thickness: 2,),
              ),
              SidebarButton(
                icon: Icons.home,
                label: "Home",
                onTap: () {
                  print("Home tapped!");
                },
              ),
              SidebarButton(
                icon: Icons.groups_outlined,
                label: "Employees",
                onTap: () {
                  print("Employees tapped!");
                },
              ),
              SidebarButton(
                icon: Icons.checklist,
                label: "Attendance",
                onTap: () {
                  print("Attendance tapped!");
                },
              ),
              SidebarButton(
                icon: Icons.calendar_month_outlined,
                label: "Summary",
                onTap: () {
                  print("Summary tapped!");
                },
              ),
              SidebarButton(
                icon: Icons.info_outline,
                label: "Information",
                onTap: () {
                  print("Information tapped!");
                },
              ),
              InkWell(
                onTap: () {
                  print("Workspaces button tapped");
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(30, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "WORKSPACES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.add),
                    ],
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                title: const Text("Adstacks"),
                trailing: const Icon(Icons.keyboard_arrow_down),
                onTap: () {},
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                title: const Text("Finance"),
                trailing: const Icon(Icons.keyboard_arrow_down),
                onTap: () {},
              ),
              SizedBox(height: 60),
              SidebarButton(
                icon: Icons.settings_outlined,
                label: "Setting",
                onTap: () {
                  print("Setting tapped!");
                },
              ),
              SidebarButton(
                icon: Icons.logout_outlined,
                label: "Logout",
                onTap: () {
                  print("Logout tapped!");
                },
              ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
    }
}


class SidebarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const SidebarButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(width: 25),
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:table_calendar/table_calendar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Home",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(width: 250), // spacing between text and search bar
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.white70),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("Search icon pressed!");
                          },
                          icon: Icon(Icons.search, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 25),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed:() {}, icon: Icon(Icons.article_outlined
                      , color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed:() {}, icon: Icon(Icons.notifications
                      , color: Colors.black)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(onPressed:() {}, icon: Icon(Icons.power_settings_new
                      , color: Colors.black)),
                ),
                SizedBox(width: 50),
                CircleAvatar(
                  radius: 18, // size
                  backgroundImage: AssetImage('assets/bitmoji.jpg'),
                  backgroundColor: Colors.black,
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TopProjectBanner(),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(child: AllProjectsCard()),
                            SizedBox(width: 20),
                            Expanded(child: TopCreatorsCard()),
                          ],
                        ),
                        SizedBox(height: 20),
                        PerformanceChartCard(),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 850,
                  color: Color(0xFF1F2251),
                  child: SidePanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopProjectBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xFF6851FF),
            Color(0xFFB95EFF),
            Colors.yellow
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding:  EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ETHEREUM 2.0",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "Top Rating \nProject",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Trending project and high rating\nProject Created by team.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 10),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF15133C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {},
        child: Text(
          "Learn More.",
          style: TextStyle(color: Colors.white),
        ),
      ),
      ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            width: 400,
            height :200,
            child: Image.asset(
              "assets/stones.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class AllProjectsCard extends StatelessWidget {
  const AllProjectsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F2251),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),

          ProjectTile(
            title: "Technology behind the Blockchain",
            subtitle: "Project #1",
            imagePath: "assets/adstacks.png",
            isSelected: true,
          ),
          SizedBox(height: 12),
          ProjectTile(
            title: "Technology behind the Blockchain",
            subtitle: "Project #1",
            imagePath: "assets/bitmoji.jpg",
          ),
          SizedBox(height: 12),
          ProjectTile(
            title: "Technology behind the Blockchain",
            subtitle: "Project #1",
            imagePath: "assets/stone.png",
          ),
        ],
      ),
    );
  }
}

class ProjectTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final bool isSelected;

  const ProjectTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Color(0xFFE84C4F)
            : Color(0xFF1D1B47),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "$subtitle  ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // handle tap
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        "  See project details",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit,
            color: Colors.white,
            size: 18,),
          ),
        ],
      ),
    );
  }
}

class TopCreatorsCard extends StatelessWidget {
  const TopCreatorsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF1F2251),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Top Creators",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          Row(
            children: const [
              Expanded(
                flex: 3,
                child: Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "Artworks",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "Rating",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),


          CreatorRow(
            username: "@maddison_c21",
            artworks: "9821",
            avatar: "assets/bitmoji.jpg",
          ),
          const SizedBox(height: 18),
          CreatorRow(
            username: "@karl.will02",
            artworks: "7032",
            avatar: "assets/bitmoji.jpg",
          ),
          const SizedBox(height: 18),
          CreatorRow(
            username: "@maddison_c21",
            artworks: "9821",
            avatar: "assets/bitmoji.jpg",
          ),
          const SizedBox(height: 18),
          CreatorRow(
            username: "@maddison_c21",
            artworks: "9821",
            avatar: "assets/bitmoji.jpg",
          ),
        ],
      ),
    );
  }
}

class CreatorRow extends StatelessWidget {
  final String username;
  final String artworks;
  final String avatar;

  const CreatorRow({
    super.key,
    required this.username,
    required this.artworks,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Name section
        Expanded(
          flex: 3,
          child: Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundImage: AssetImage(avatar),
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        /// Artworks
        Expanded(
          flex: 2,
          child: Text(
            artworks,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        /// Rating bar
        Expanded(
          flex: 1,
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}


class PerformanceChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Over All Performance \nThe Years",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: SizedBox()),
              Text(
                "*  Pending  \n    Done",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20,),
              Text(
                "*  Project  \n    Done",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.white,
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50, // ✅ prevent clipping
                      interval: 10,
                      getTitlesWidget: (value, meta) => Text(
                        '${value.toInt()}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40, // ✅ prevent clipping
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(2015, 10),
                      FlSpot(2016, 25),
                      FlSpot(2017, 15),
                      FlSpot(2018, 40),
                      FlSpot(2019, 20),
                      FlSpot(2020, 45),
                    ],
                    isCurved: true,
                    color: Colors.deepPurple,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple.withOpacity(0.3),
                          Colors.deepPurple.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(2015, 20),
                      FlSpot(2016, 15),
                      FlSpot(2017, 30),
                      FlSpot(2018, 10),
                      FlSpot(2019, 35),
                      FlSpot(2020, 25),
                    ],
                    isCurved: true,
                    color: Colors.redAccent,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.redAccent.withOpacity(0.3),
                          Colors.redAccent.withOpacity(0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          "${spot.x.toInt()} : ${spot.y.toInt()}",
                          TextStyle(
                            color: spot.bar.color,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class SidePanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "GENERAL 10:00 AM TO 7:00 PM",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            CustomStyledCalendar(),
            SizedBox(height: 15),
            BirthdayCard(title: "Today Birthday", wish:"Birthday", count: 2),
            SizedBox(height: 15),
            BirthdayCard(title: "Anniversary",wish:"Anniversary", count: 3),
          ],
        ),
      ),
    );
  }
}

class CustomStyledCalendar extends StatefulWidget {
  @override
  State<CustomStyledCalendar> createState() => _CustomStyledCalendarState();
}

class _CustomStyledCalendarState extends State<CustomStyledCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF322A4D),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white24),
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xFF6851FF),
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: Colors.white),
              weekendTextStyle: TextStyle(color: Colors.white),
              outsideDaysVisible: false,
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronIcon: Icon(Icons.chevron_left, color: Colors.white),
              rightChevronIcon: Icon(Icons.chevron_right, color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white60),
              weekendStyle: TextStyle(color: Colors.white60),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
      ),
    );
  }
}

class BirthdayCard extends StatelessWidget {
  final String title;
  final int count;
  final String wish;

  const BirthdayCard({
    required this.title,
    required this.count,
    required this.wish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF322A4D),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "✨ $title ✨",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              count,
                  (index) =>
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/bitmoji.jpg",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

            ),
          ),
          SizedBox(height: 10),
          Text(
            "Total  |  $count  |" ,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF875BF7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Icon(Icons.navigation_outlined , color: Colors.white,),
                Text("  $wish Wishing  " , style: TextStyle(color: Colors.white),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecentFile {
  final String? icon, title, date, size,status;

  RecentFile({this.icon, this.title, this.date, this.size,this.status});
}

List demoRecentFiles = [
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Ac cleaning",
    date: "01-03-2021",
    size: "₹ 499",
    status: "Completed"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Ac Repair",
    date: "27-02-2021",
    size: "₹ 499",
      status: "On processing"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Ac install",
    date: "23-02-2021",
    size: "₹ 499",
      status: "Completed"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Ac cleaning",
    date: "21-02-2021",
    size: "₹ 499",
      status: "Completed"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Ac install",
    date: "23-02-2021",
    size: "₹ 499",
      status: "On processing"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Sales PDF",
    date: "25-02-2021",
    size: "₹ 499",
      status: "Completed"
  ),
  RecentFile(
    icon: "assets/icon/user.png",
    title: "Excel File",
    date: "25-02-2021",
    size: "₹ 499",
      status: "Completed"
  ),
];

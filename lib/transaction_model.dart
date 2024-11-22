class Transaction {
  final String title;
  final String description;
  final String amount;
  final bool isDebit;

  Transaction(
      {required this.title,
      required this.description,
      required this.amount,
      this.isDebit = true});
}

List<Transaction> transactions = [
  Transaction(
      title: "Google Courses",
      description: "App Design Basics",
      amount: '-\$189',
      isDebit: true),
  Transaction(
      title: "Microsoft",
      description: "Cloud Services",
      amount: '-\$219',
      isDebit: false),
  Transaction(
      title: "Freelance Payment",
      description: "Project X",
      amount: '-\$49',
      isDebit: false),
];

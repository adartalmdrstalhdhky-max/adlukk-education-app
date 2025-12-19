StreamBuilder(
  stream: FirebaseFirestore.instance.collection('students').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return CircularProgressIndicator();
    var studentData = snapshot.data!.docs.first;
    return Column(
      children: [
        Text("اسم الطالب: ${studentData['name']}"),
        Text("الرصيد المالي: ${studentData['balance']}"),
      ],
    );
  },
)
  

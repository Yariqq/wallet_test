class Candidate {
  final String name;
  final String position;

  const Candidate({
    required this.name,
    required this.position,
  });

  Candidate.empty()
      : name = '',
        position = '';
}

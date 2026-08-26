class ApiResponse<T> {
  final int? count;
  final String? next;
  final String? previous;
  final List<T> results;

  const ApiResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results:
          (json['results'] as List<dynamic>).map((e) => fromJsonT(e)).toList(),
    );
  }

  bool get hasNext => next != null;

  int get totalPages =>
      count != null ? (count! / results.length).ceil() : 0;
}

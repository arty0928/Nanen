class WebtoonModel {
  final String title, thumb, id;

  //{id: 787465, title: 철수와 영희 이야기, thumb: https://image-comic.pstatic.net/webtoon/787465/thumbnail/thumbnail_IMAG21_3835207836886250084.jpg}

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}

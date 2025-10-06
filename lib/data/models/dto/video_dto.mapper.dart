// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'video_dto.dart';

class VideoDtoMapper extends ClassMapperBase<VideoDto> {
  VideoDtoMapper._();

  static VideoDtoMapper? _instance;
  static VideoDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoDtoMapper._());
      VideoFileDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'VideoDto';

  static int _$id(VideoDto v) => v.id;
  static const Field<VideoDto, int> _f$id = Field('id', _$id);
  static int _$width(VideoDto v) => v.width;
  static const Field<VideoDto, int> _f$width = Field('width', _$width);
  static int _$height(VideoDto v) => v.height;
  static const Field<VideoDto, int> _f$height = Field('height', _$height);
  static List<VideoFileDto> _$videoFiles(VideoDto v) => v.videoFiles;
  static const Field<VideoDto, List<VideoFileDto>> _f$videoFiles =
      Field('videoFiles', _$videoFiles);

  @override
  final MappableFields<VideoDto> fields = const {
    #id: _f$id,
    #width: _f$width,
    #height: _f$height,
    #videoFiles: _f$videoFiles,
  };

  static VideoDto _instantiate(DecodingData data) {
    return VideoDto(
        id: data.dec(_f$id),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        videoFiles: data.dec(_f$videoFiles));
  }

  @override
  final Function instantiate = _instantiate;

  static VideoDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoDto>(map);
  }

  static VideoDto fromJson(String json) {
    return ensureInitialized().decodeJson<VideoDto>(json);
  }
}

mixin VideoDtoMappable {
  String toJson() {
    return VideoDtoMapper.ensureInitialized()
        .encodeJson<VideoDto>(this as VideoDto);
  }

  Map<String, dynamic> toMap() {
    return VideoDtoMapper.ensureInitialized()
        .encodeMap<VideoDto>(this as VideoDto);
  }

  VideoDtoCopyWith<VideoDto, VideoDto, VideoDto> get copyWith =>
      _VideoDtoCopyWithImpl(this as VideoDto, $identity, $identity);
  @override
  String toString() {
    return VideoDtoMapper.ensureInitialized().stringifyValue(this as VideoDto);
  }

  @override
  bool operator ==(Object other) {
    return VideoDtoMapper.ensureInitialized()
        .equalsValue(this as VideoDto, other);
  }

  @override
  int get hashCode {
    return VideoDtoMapper.ensureInitialized().hashValue(this as VideoDto);
  }
}

extension VideoDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, VideoDto, $Out> {
  VideoDtoCopyWith<$R, VideoDto, $Out> get $asVideoDto =>
      $base.as((v, t, t2) => _VideoDtoCopyWithImpl(v, t, t2));
}

abstract class VideoDtoCopyWith<$R, $In extends VideoDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, VideoFileDto,
      VideoFileDtoCopyWith<$R, VideoFileDto, VideoFileDto>> get videoFiles;
  $R call({int? id, int? width, int? height, List<VideoFileDto>? videoFiles});
  VideoDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VideoDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoDto, $Out>
    implements VideoDtoCopyWith<$R, VideoDto, $Out> {
  _VideoDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoDto> $mapper =
      VideoDtoMapper.ensureInitialized();
  @override
  ListCopyWith<$R, VideoFileDto,
          VideoFileDtoCopyWith<$R, VideoFileDto, VideoFileDto>>
      get videoFiles => ListCopyWith($value.videoFiles,
          (v, t) => v.copyWith.$chain(t), (v) => call(videoFiles: v));
  @override
  $R call({int? id, int? width, int? height, List<VideoFileDto>? videoFiles}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (videoFiles != null) #videoFiles: videoFiles
      }));
  @override
  VideoDto $make(CopyWithData data) => VideoDto(
      id: data.get(#id, or: $value.id),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      videoFiles: data.get(#videoFiles, or: $value.videoFiles));

  @override
  VideoDtoCopyWith<$R2, VideoDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoDtoCopyWithImpl($value, $cast, t);
}

class VideoFileDtoMapper extends ClassMapperBase<VideoFileDto> {
  VideoFileDtoMapper._();

  static VideoFileDtoMapper? _instance;
  static VideoFileDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VideoFileDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'VideoFileDto';

  static String _$link(VideoFileDto v) => v.link;
  static const Field<VideoFileDto, String> _f$link = Field('link', _$link);
  static String _$quality(VideoFileDto v) => v.quality;
  static const Field<VideoFileDto, String> _f$quality =
      Field('quality', _$quality);

  @override
  final MappableFields<VideoFileDto> fields = const {
    #link: _f$link,
    #quality: _f$quality,
  };

  static VideoFileDto _instantiate(DecodingData data) {
    return VideoFileDto(link: data.dec(_f$link), quality: data.dec(_f$quality));
  }

  @override
  final Function instantiate = _instantiate;

  static VideoFileDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VideoFileDto>(map);
  }

  static VideoFileDto fromJson(String json) {
    return ensureInitialized().decodeJson<VideoFileDto>(json);
  }
}

mixin VideoFileDtoMappable {
  String toJson() {
    return VideoFileDtoMapper.ensureInitialized()
        .encodeJson<VideoFileDto>(this as VideoFileDto);
  }

  Map<String, dynamic> toMap() {
    return VideoFileDtoMapper.ensureInitialized()
        .encodeMap<VideoFileDto>(this as VideoFileDto);
  }

  VideoFileDtoCopyWith<VideoFileDto, VideoFileDto, VideoFileDto> get copyWith =>
      _VideoFileDtoCopyWithImpl(this as VideoFileDto, $identity, $identity);
  @override
  String toString() {
    return VideoFileDtoMapper.ensureInitialized()
        .stringifyValue(this as VideoFileDto);
  }

  @override
  bool operator ==(Object other) {
    return VideoFileDtoMapper.ensureInitialized()
        .equalsValue(this as VideoFileDto, other);
  }

  @override
  int get hashCode {
    return VideoFileDtoMapper.ensureInitialized()
        .hashValue(this as VideoFileDto);
  }
}

extension VideoFileDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VideoFileDto, $Out> {
  VideoFileDtoCopyWith<$R, VideoFileDto, $Out> get $asVideoFileDto =>
      $base.as((v, t, t2) => _VideoFileDtoCopyWithImpl(v, t, t2));
}

abstract class VideoFileDtoCopyWith<$R, $In extends VideoFileDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? link, String? quality});
  VideoFileDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _VideoFileDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VideoFileDto, $Out>
    implements VideoFileDtoCopyWith<$R, VideoFileDto, $Out> {
  _VideoFileDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VideoFileDto> $mapper =
      VideoFileDtoMapper.ensureInitialized();
  @override
  $R call({String? link, String? quality}) => $apply(FieldCopyWithData(
      {if (link != null) #link: link, if (quality != null) #quality: quality}));
  @override
  VideoFileDto $make(CopyWithData data) => VideoFileDto(
      link: data.get(#link, or: $value.link),
      quality: data.get(#quality, or: $value.quality));

  @override
  VideoFileDtoCopyWith<$R2, VideoFileDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VideoFileDtoCopyWithImpl($value, $cast, t);
}

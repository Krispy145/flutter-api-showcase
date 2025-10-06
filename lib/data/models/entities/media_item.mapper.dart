// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'media_item.dart';

class MediaTypeMapper extends EnumMapper<MediaType> {
  MediaTypeMapper._();

  static MediaTypeMapper? _instance;
  static MediaTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaTypeMapper._());
    }
    return _instance!;
  }

  static MediaType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  MediaType decode(dynamic value) {
    switch (value) {
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(MediaType self) {
    switch (self) {
      case MediaType.image:
        return 'image';
      case MediaType.video:
        return 'video';
    }
  }
}

extension MediaTypeMapperExtension on MediaType {
  String toValue() {
    MediaTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<MediaType>(this) as String;
  }
}

class MediaItemMapper extends ClassMapperBase<MediaItem> {
  MediaItemMapper._();

  static MediaItemMapper? _instance;
  static MediaItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MediaItemMapper._());
      MediaTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'MediaItem';

  static String _$id(MediaItem v) => v.id;
  static const Field<MediaItem, String> _f$id = Field('id', _$id);
  static MediaType _$type(MediaItem v) => v.type;
  static const Field<MediaItem, MediaType> _f$type = Field('type', _$type);
  static String _$thumbnailUrl(MediaItem v) => v.thumbnailUrl;
  static const Field<MediaItem, String> _f$thumbnailUrl =
      Field('thumbnailUrl', _$thumbnailUrl);
  static String _$displayUrl(MediaItem v) => v.displayUrl;
  static const Field<MediaItem, String> _f$displayUrl =
      Field('displayUrl', _$displayUrl);
  static String _$author(MediaItem v) => v.author;
  static const Field<MediaItem, String> _f$author = Field('author', _$author);
  static int _$width(MediaItem v) => v.width;
  static const Field<MediaItem, int> _f$width = Field('width', _$width);
  static int _$height(MediaItem v) => v.height;
  static const Field<MediaItem, int> _f$height = Field('height', _$height);

  @override
  final MappableFields<MediaItem> fields = const {
    #id: _f$id,
    #type: _f$type,
    #thumbnailUrl: _f$thumbnailUrl,
    #displayUrl: _f$displayUrl,
    #author: _f$author,
    #width: _f$width,
    #height: _f$height,
  };

  static MediaItem _instantiate(DecodingData data) {
    return MediaItem(
        id: data.dec(_f$id),
        type: data.dec(_f$type),
        thumbnailUrl: data.dec(_f$thumbnailUrl),
        displayUrl: data.dec(_f$displayUrl),
        author: data.dec(_f$author),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static MediaItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MediaItem>(map);
  }

  static MediaItem fromJson(String json) {
    return ensureInitialized().decodeJson<MediaItem>(json);
  }
}

mixin MediaItemMappable {
  String toJson() {
    return MediaItemMapper.ensureInitialized()
        .encodeJson<MediaItem>(this as MediaItem);
  }

  Map<String, dynamic> toMap() {
    return MediaItemMapper.ensureInitialized()
        .encodeMap<MediaItem>(this as MediaItem);
  }

  MediaItemCopyWith<MediaItem, MediaItem, MediaItem> get copyWith =>
      _MediaItemCopyWithImpl(this as MediaItem, $identity, $identity);
  @override
  String toString() {
    return MediaItemMapper.ensureInitialized()
        .stringifyValue(this as MediaItem);
  }

  @override
  bool operator ==(Object other) {
    return MediaItemMapper.ensureInitialized()
        .equalsValue(this as MediaItem, other);
  }

  @override
  int get hashCode {
    return MediaItemMapper.ensureInitialized().hashValue(this as MediaItem);
  }
}

extension MediaItemValueCopy<$R, $Out> on ObjectCopyWith<$R, MediaItem, $Out> {
  MediaItemCopyWith<$R, MediaItem, $Out> get $asMediaItem =>
      $base.as((v, t, t2) => _MediaItemCopyWithImpl(v, t, t2));
}

abstract class MediaItemCopyWith<$R, $In extends MediaItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? id,
      MediaType? type,
      String? thumbnailUrl,
      String? displayUrl,
      String? author,
      int? width,
      int? height});
  MediaItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MediaItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MediaItem, $Out>
    implements MediaItemCopyWith<$R, MediaItem, $Out> {
  _MediaItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MediaItem> $mapper =
      MediaItemMapper.ensureInitialized();
  @override
  $R call(
          {String? id,
          MediaType? type,
          String? thumbnailUrl,
          String? displayUrl,
          String? author,
          int? width,
          int? height}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (type != null) #type: type,
        if (thumbnailUrl != null) #thumbnailUrl: thumbnailUrl,
        if (displayUrl != null) #displayUrl: displayUrl,
        if (author != null) #author: author,
        if (width != null) #width: width,
        if (height != null) #height: height
      }));
  @override
  MediaItem $make(CopyWithData data) => MediaItem(
      id: data.get(#id, or: $value.id),
      type: data.get(#type, or: $value.type),
      thumbnailUrl: data.get(#thumbnailUrl, or: $value.thumbnailUrl),
      displayUrl: data.get(#displayUrl, or: $value.displayUrl),
      author: data.get(#author, or: $value.author),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  MediaItemCopyWith<$R2, MediaItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MediaItemCopyWithImpl($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'photo_dto.dart';

class PhotoDtoMapper extends ClassMapperBase<PhotoDto> {
  PhotoDtoMapper._();

  static PhotoDtoMapper? _instance;
  static PhotoDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhotoDtoMapper._());
      PhotoSrcDtoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PhotoDto';

  static int _$id(PhotoDto v) => v.id;
  static const Field<PhotoDto, int> _f$id = Field('id', _$id);
  static int _$width(PhotoDto v) => v.width;
  static const Field<PhotoDto, int> _f$width = Field('width', _$width);
  static int _$height(PhotoDto v) => v.height;
  static const Field<PhotoDto, int> _f$height = Field('height', _$height);
  static String _$photographer(PhotoDto v) => v.photographer;
  static const Field<PhotoDto, String> _f$photographer =
      Field('photographer', _$photographer);
  static PhotoSrcDto _$src(PhotoDto v) => v.src;
  static const Field<PhotoDto, PhotoSrcDto> _f$src = Field('src', _$src);

  @override
  final MappableFields<PhotoDto> fields = const {
    #id: _f$id,
    #width: _f$width,
    #height: _f$height,
    #photographer: _f$photographer,
    #src: _f$src,
  };

  static PhotoDto _instantiate(DecodingData data) {
    return PhotoDto(
        id: data.dec(_f$id),
        width: data.dec(_f$width),
        height: data.dec(_f$height),
        photographer: data.dec(_f$photographer),
        src: data.dec(_f$src));
  }

  @override
  final Function instantiate = _instantiate;

  static PhotoDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PhotoDto>(map);
  }

  static PhotoDto fromJson(String json) {
    return ensureInitialized().decodeJson<PhotoDto>(json);
  }
}

mixin PhotoDtoMappable {
  String toJson() {
    return PhotoDtoMapper.ensureInitialized()
        .encodeJson<PhotoDto>(this as PhotoDto);
  }

  Map<String, dynamic> toMap() {
    return PhotoDtoMapper.ensureInitialized()
        .encodeMap<PhotoDto>(this as PhotoDto);
  }

  PhotoDtoCopyWith<PhotoDto, PhotoDto, PhotoDto> get copyWith =>
      _PhotoDtoCopyWithImpl(this as PhotoDto, $identity, $identity);
  @override
  String toString() {
    return PhotoDtoMapper.ensureInitialized().stringifyValue(this as PhotoDto);
  }

  @override
  bool operator ==(Object other) {
    return PhotoDtoMapper.ensureInitialized()
        .equalsValue(this as PhotoDto, other);
  }

  @override
  int get hashCode {
    return PhotoDtoMapper.ensureInitialized().hashValue(this as PhotoDto);
  }
}

extension PhotoDtoValueCopy<$R, $Out> on ObjectCopyWith<$R, PhotoDto, $Out> {
  PhotoDtoCopyWith<$R, PhotoDto, $Out> get $asPhotoDto =>
      $base.as((v, t, t2) => _PhotoDtoCopyWithImpl(v, t, t2));
}

abstract class PhotoDtoCopyWith<$R, $In extends PhotoDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  PhotoSrcDtoCopyWith<$R, PhotoSrcDto, PhotoSrcDto> get src;
  $R call(
      {int? id,
      int? width,
      int? height,
      String? photographer,
      PhotoSrcDto? src});
  PhotoDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PhotoDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PhotoDto, $Out>
    implements PhotoDtoCopyWith<$R, PhotoDto, $Out> {
  _PhotoDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhotoDto> $mapper =
      PhotoDtoMapper.ensureInitialized();
  @override
  PhotoSrcDtoCopyWith<$R, PhotoSrcDto, PhotoSrcDto> get src =>
      $value.src.copyWith.$chain((v) => call(src: v));
  @override
  $R call(
          {int? id,
          int? width,
          int? height,
          String? photographer,
          PhotoSrcDto? src}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (width != null) #width: width,
        if (height != null) #height: height,
        if (photographer != null) #photographer: photographer,
        if (src != null) #src: src
      }));
  @override
  PhotoDto $make(CopyWithData data) => PhotoDto(
      id: data.get(#id, or: $value.id),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height),
      photographer: data.get(#photographer, or: $value.photographer),
      src: data.get(#src, or: $value.src));

  @override
  PhotoDtoCopyWith<$R2, PhotoDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PhotoDtoCopyWithImpl($value, $cast, t);
}

class PhotoSrcDtoMapper extends ClassMapperBase<PhotoSrcDto> {
  PhotoSrcDtoMapper._();

  static PhotoSrcDtoMapper? _instance;
  static PhotoSrcDtoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PhotoSrcDtoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'PhotoSrcDto';

  static String _$original(PhotoSrcDto v) => v.original;
  static const Field<PhotoSrcDto, String> _f$original =
      Field('original', _$original);
  static String _$large(PhotoSrcDto v) => v.large;
  static const Field<PhotoSrcDto, String> _f$large = Field('large', _$large);
  static String _$medium(PhotoSrcDto v) => v.medium;
  static const Field<PhotoSrcDto, String> _f$medium = Field('medium', _$medium);
  static String _$small(PhotoSrcDto v) => v.small;
  static const Field<PhotoSrcDto, String> _f$small = Field('small', _$small);

  @override
  final MappableFields<PhotoSrcDto> fields = const {
    #original: _f$original,
    #large: _f$large,
    #medium: _f$medium,
    #small: _f$small,
  };

  static PhotoSrcDto _instantiate(DecodingData data) {
    return PhotoSrcDto(
        original: data.dec(_f$original),
        large: data.dec(_f$large),
        medium: data.dec(_f$medium),
        small: data.dec(_f$small));
  }

  @override
  final Function instantiate = _instantiate;

  static PhotoSrcDto fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PhotoSrcDto>(map);
  }

  static PhotoSrcDto fromJson(String json) {
    return ensureInitialized().decodeJson<PhotoSrcDto>(json);
  }
}

mixin PhotoSrcDtoMappable {
  String toJson() {
    return PhotoSrcDtoMapper.ensureInitialized()
        .encodeJson<PhotoSrcDto>(this as PhotoSrcDto);
  }

  Map<String, dynamic> toMap() {
    return PhotoSrcDtoMapper.ensureInitialized()
        .encodeMap<PhotoSrcDto>(this as PhotoSrcDto);
  }

  PhotoSrcDtoCopyWith<PhotoSrcDto, PhotoSrcDto, PhotoSrcDto> get copyWith =>
      _PhotoSrcDtoCopyWithImpl(this as PhotoSrcDto, $identity, $identity);
  @override
  String toString() {
    return PhotoSrcDtoMapper.ensureInitialized()
        .stringifyValue(this as PhotoSrcDto);
  }

  @override
  bool operator ==(Object other) {
    return PhotoSrcDtoMapper.ensureInitialized()
        .equalsValue(this as PhotoSrcDto, other);
  }

  @override
  int get hashCode {
    return PhotoSrcDtoMapper.ensureInitialized().hashValue(this as PhotoSrcDto);
  }
}

extension PhotoSrcDtoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PhotoSrcDto, $Out> {
  PhotoSrcDtoCopyWith<$R, PhotoSrcDto, $Out> get $asPhotoSrcDto =>
      $base.as((v, t, t2) => _PhotoSrcDtoCopyWithImpl(v, t, t2));
}

abstract class PhotoSrcDtoCopyWith<$R, $In extends PhotoSrcDto, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? original, String? large, String? medium, String? small});
  PhotoSrcDtoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PhotoSrcDtoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PhotoSrcDto, $Out>
    implements PhotoSrcDtoCopyWith<$R, PhotoSrcDto, $Out> {
  _PhotoSrcDtoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PhotoSrcDto> $mapper =
      PhotoSrcDtoMapper.ensureInitialized();
  @override
  $R call({String? original, String? large, String? medium, String? small}) =>
      $apply(FieldCopyWithData({
        if (original != null) #original: original,
        if (large != null) #large: large,
        if (medium != null) #medium: medium,
        if (small != null) #small: small
      }));
  @override
  PhotoSrcDto $make(CopyWithData data) => PhotoSrcDto(
      original: data.get(#original, or: $value.original),
      large: data.get(#large, or: $value.large),
      medium: data.get(#medium, or: $value.medium),
      small: data.get(#small, or: $value.small));

  @override
  PhotoSrcDtoCopyWith<$R2, PhotoSrcDto, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PhotoSrcDtoCopyWithImpl($value, $cast, t);
}

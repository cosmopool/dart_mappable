// ignore_for_file: unused_element
import 'package:dart_mappable/dart_mappable.dart';
import 'package:dart_mappable/internals.dart';

import 'main.dart' as p0;


// === ALL STATICALLY REGISTERED MAPPERS ===

var _mappers = <BaseMapper>{
  // class mappers
  UnionMapper._(),
  DataMapper._(),
  LoadingMapper._(),
  ErrorDetailsMapper._(),
  // enum mappers
  // custom mappers
};


// === GENERATED CLASS MAPPERS AND EXTENSIONS ===

class UnionMapper extends BaseMapper<p0.Union> {
  UnionMapper._();

  @override Function get decoder => decode;
  p0.Union decode(dynamic v) => checked(v, (Map<String, dynamic> map) {
    switch(map['type']) {
      case 'data': return DataMapper._().decode(map);
      case 'error': return ErrorDetailsMapper._().decode(map);
      case 'loading': return LoadingMapper._().decode(map);
      default: return fromMap(map);
    }
  });
  p0.Union fromMap(Map<String, dynamic> map) => throw MapperException.missingSubclass('Union', 'type', '${map['type']}');

  @override Function get encoder => encode;
  dynamic encode(p0.Union v) => toMap(v);
  Map<String, dynamic> toMap(p0.Union u) => {};

  @override String stringify(p0.Union self) => 'Union()';
  @override int hash(p0.Union self) => 0;
  @override bool equals(p0.Union self, p0.Union other) => true;

  @override Function get typeFactory => (f) => f<p0.Union>();
}

extension UnionMapperExtension on p0.Union {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin UnionMixin {
  UnionCopyWith<p0.Union, p0.Union, p0.Union> get copyWith;
}

abstract class UnionCopyWith<$R, $T extends p0.Union, $S extends p0.Union> implements ObjectCopyWith<$R, $T, $S> {
  UnionCopyWith<$R2, $T, $S2> _chain<$R2, $S2 extends p0.Union>(Then<$S2, $R2> then, Then<p0.Union, $S2> then2);
  $R call();
}


class DataMapper extends BaseMapper<p0.Data> {
  DataMapper._();

  @override Function get decoder => decode;
  p0.Data decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Data fromMap(Map<String, dynamic> map) => p0.Data(Mapper.i.$get(map, 'mykey'));

  @override Function get encoder => encode;
  dynamic encode(p0.Data v) => toMap(v);
  Map<String, dynamic> toMap(p0.Data d) => {'mykey': Mapper.i.$enc(d.value, 'value'), 'type': 'data'};

  @override String stringify(p0.Data self) => 'Data()';
  @override int hash(p0.Data self) => 0;
  @override bool equals(p0.Data self, p0.Data other) => true;

  @override Function get typeFactory => (f) => f<p0.Data>();
}

extension DataMapperExtension on p0.Data {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin DataMixin {
  DataCopyWith<p0.Data, p0.Data> get copyWith => _DataCopyWithImpl(this as p0.Data, $identity, $identity);
}

extension DataObjectCopy<$R, $S extends p0.Union> on ObjectCopyWith<$R, p0.Data, $S> {
  DataCopyWith<$R, $S> get asData => base.as((v, t, t2) => _DataCopyWithImpl(v, t, t2));
}

abstract class DataCopyWith<$R, $S extends p0.Union> implements UnionCopyWith<$R, p0.Data, $S> {
  @override $R call({int? value});
}

class _DataCopyWithImpl<$R, $S extends p0.Union> extends BaseCopyWith<$R, p0.Data, $S> implements DataCopyWith<$R, $S> {
  _DataCopyWithImpl(super.value, super.then, super.then2);
  @override DataCopyWith<$R2, $S2> _chain<$R2, $S2 extends p0.Union>(Then<$S2, $R2> then, Then<p0.Data, $S2> then2) => _DataCopyWithImpl($value, then, then2);

  @override $R call({int? value}) => $then(p0.Data(value ?? $value.value));
}

class LoadingMapper extends BaseMapper<p0.Loading> {
  LoadingMapper._();

  @override Function get decoder => decode;
  p0.Loading decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.Loading fromMap(Map<String, dynamic> map) => p0.Loading();

  @override Function get encoder => encode;
  dynamic encode(p0.Loading v) => toMap(v);
  Map<String, dynamic> toMap(p0.Loading l) => {'type': 'loading'};

  @override String stringify(p0.Loading self) => 'Loading()';
  @override int hash(p0.Loading self) => 0;
  @override bool equals(p0.Loading self, p0.Loading other) => true;

  @override Function get typeFactory => (f) => f<p0.Loading>();
}

extension LoadingMapperExtension on p0.Loading {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin LoadingMixin {
  LoadingCopyWith<p0.Loading, p0.Loading> get copyWith => _LoadingCopyWithImpl(this as p0.Loading, $identity, $identity);
}

extension LoadingObjectCopy<$R, $S extends p0.Union> on ObjectCopyWith<$R, p0.Loading, $S> {
  LoadingCopyWith<$R, $S> get asLoading => base.as((v, t, t2) => _LoadingCopyWithImpl(v, t, t2));
}

abstract class LoadingCopyWith<$R, $S extends p0.Union> implements UnionCopyWith<$R, p0.Loading, $S> {
  @override $R call();
}

class _LoadingCopyWithImpl<$R, $S extends p0.Union> extends BaseCopyWith<$R, p0.Loading, $S> implements LoadingCopyWith<$R, $S> {
  _LoadingCopyWithImpl(super.value, super.then, super.then2);
  @override LoadingCopyWith<$R2, $S2> _chain<$R2, $S2 extends p0.Union>(Then<$S2, $R2> then, Then<p0.Loading, $S2> then2) => _LoadingCopyWithImpl($value, then, then2);

  @override $R call() => $then(p0.Loading());
}

class ErrorDetailsMapper extends BaseMapper<p0.ErrorDetails> {
  ErrorDetailsMapper._();

  @override Function get decoder => decode;
  p0.ErrorDetails decode(dynamic v) => checked(v, (Map<String, dynamic> map) => fromMap(map));
  p0.ErrorDetails fromMap(Map<String, dynamic> map) => p0.ErrorDetails(Mapper.i.$getOpt(map, 'message'));

  @override Function get encoder => encode;
  dynamic encode(p0.ErrorDetails v) => toMap(v);
  Map<String, dynamic> toMap(p0.ErrorDetails e) => {'message': Mapper.i.$enc(e.message, 'message'), 'type': 'error'};

  @override String stringify(p0.ErrorDetails self) => 'ErrorDetails()';
  @override int hash(p0.ErrorDetails self) => 0;
  @override bool equals(p0.ErrorDetails self, p0.ErrorDetails other) => true;

  @override Function get typeFactory => (f) => f<p0.ErrorDetails>();
}

extension ErrorDetailsMapperExtension on p0.ErrorDetails {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);
}

mixin ErrorDetailsMixin {
  ErrorDetailsCopyWith<p0.ErrorDetails, p0.ErrorDetails> get copyWith => _ErrorDetailsCopyWithImpl(this as p0.ErrorDetails, $identity, $identity);
}

extension ErrorDetailsObjectCopy<$R, $S extends p0.Union> on ObjectCopyWith<$R, p0.ErrorDetails, $S> {
  ErrorDetailsCopyWith<$R, $S> get asErrorDetails => base.as((v, t, t2) => _ErrorDetailsCopyWithImpl(v, t, t2));
}

abstract class ErrorDetailsCopyWith<$R, $S extends p0.Union> implements UnionCopyWith<$R, p0.ErrorDetails, $S> {
  @override $R call({String? message});
}

class _ErrorDetailsCopyWithImpl<$R, $S extends p0.Union> extends BaseCopyWith<$R, p0.ErrorDetails, $S> implements ErrorDetailsCopyWith<$R, $S> {
  _ErrorDetailsCopyWithImpl(super.value, super.then, super.then2);
  @override ErrorDetailsCopyWith<$R2, $S2> _chain<$R2, $S2 extends p0.Union>(Then<$S2, $R2> then, Then<p0.ErrorDetails, $S2> then2) => _ErrorDetailsCopyWithImpl($value, then, then2);

  @override $R call({Object? message = $none}) => $then(p0.ErrorDetails(or(message, $value.message)));
}


// === GENERATED ENUM MAPPERS AND EXTENSIONS ===




// === GENERATED UTILITY CODE ===

class Mapper {
  Mapper._();

  static MapperContainer i = MapperContainer(_mappers);

  static T fromValue<T>(dynamic value) => i.fromValue<T>(value);
  static T fromMap<T>(Map<String, dynamic> map) => i.fromMap<T>(map);
  static T fromIterable<T>(Iterable<dynamic> iterable) => i.fromIterable<T>(iterable);
  static T fromJson<T>(String json) => i.fromJson<T>(json);

  static dynamic toValue<T>(T value) => i.toValue<T>(value);
  static Map<String, dynamic> toMap<T>(T object) => i.toMap<T>(object);
  static Iterable<dynamic> toIterable<T>(T object) => i.toIterable<T>(object);
  static String toJson<T>(T object) => i.toJson<T>(object);

  static bool isEqual(dynamic value, Object? other) => i.isEqual(value, other);
  static int hash(dynamic value) => i.hash(value);
  static String asString(dynamic value) => i.asString(value);

  static void use<T>(BaseMapper<T> mapper) => i.use<T>(mapper);
  static BaseMapper<T>? unuse<T>() => i.unuse<T>();
  static void useAll(List<BaseMapper> mappers) => i.useAll(mappers);

  static BaseMapper<T>? get<T>([Type? type]) => i.get<T>(type);
  static List<BaseMapper> getAll() => i.getAll();
}

mixin Mappable implements MappableMixin {
  String toJson() => Mapper.toJson(this);
  Map<String, dynamic> toMap() => Mapper.toMap(this);

  @override
  String toString() {
    return _guard(() => Mapper.asString(this), super.toString);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            _guard(() => Mapper.isEqual(this, other), () => super == other));
  }

  @override
  int get hashCode {
    return _guard(() => Mapper.hash(this), () => super.hashCode);
  }

  T _guard<T>(T Function() fn, T Function() fallback) {
    try {
      return fn();
    } on MapperException catch (e) {
      if (e.isUnsupportedOrUnallowed()) {
        return fallback();
      } else {
        rethrow;
      }
    }
  }
}

extension _ChainedCopyWith<$R, $T, $S> on ObjectCopyWith<$R, $T, $S> {
  BaseCopyWith<$R, $T, $S> get base => this as BaseCopyWith<$R, $T, $S>;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class User extends DataClass implements Insertable<User> {
  final int idUser;
  final String eMail;
  final String passWord;
  User({this.idUser, @required this.eMail, @required this.passWord});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return User(
      idUser:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_user']),
      eMail:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}e_mail']),
      passWord: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}pass_word']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idUser != null) {
      map['id_user'] = Variable<int>(idUser);
    }
    if (!nullToAbsent || eMail != null) {
      map['e_mail'] = Variable<String>(eMail);
    }
    if (!nullToAbsent || passWord != null) {
      map['pass_word'] = Variable<String>(passWord);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      idUser:
          idUser == null && nullToAbsent ? const Value.absent() : Value(idUser),
      eMail:
          eMail == null && nullToAbsent ? const Value.absent() : Value(eMail),
      passWord: passWord == null && nullToAbsent
          ? const Value.absent()
          : Value(passWord),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      idUser: serializer.fromJson<int>(json['idUser']),
      eMail: serializer.fromJson<String>(json['eMail']),
      passWord: serializer.fromJson<String>(json['passWord']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUser': serializer.toJson<int>(idUser),
      'eMail': serializer.toJson<String>(eMail),
      'passWord': serializer.toJson<String>(passWord),
    };
  }

  User copyWith({int idUser, String eMail, String passWord}) => User(
        idUser: idUser ?? this.idUser,
        eMail: eMail ?? this.eMail,
        passWord: passWord ?? this.passWord,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('idUser: $idUser, ')
          ..write('eMail: $eMail, ')
          ..write('passWord: $passWord')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(idUser.hashCode, $mrjc(eMail.hashCode, passWord.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.idUser == this.idUser &&
          other.eMail == this.eMail &&
          other.passWord == this.passWord);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> idUser;
  final Value<String> eMail;
  final Value<String> passWord;
  const UsersCompanion({
    this.idUser = const Value.absent(),
    this.eMail = const Value.absent(),
    this.passWord = const Value.absent(),
  });
  UsersCompanion.insert({
    this.idUser = const Value.absent(),
    @required String eMail,
    @required String passWord,
  })  : eMail = Value(eMail),
        passWord = Value(passWord);
  static Insertable<User> custom({
    Expression<int> idUser,
    Expression<String> eMail,
    Expression<String> passWord,
  }) {
    return RawValuesInsertable({
      if (idUser != null) 'id_user': idUser,
      if (eMail != null) 'e_mail': eMail,
      if (passWord != null) 'pass_word': passWord,
    });
  }

  UsersCompanion copyWith(
      {Value<int> idUser, Value<String> eMail, Value<String> passWord}) {
    return UsersCompanion(
      idUser: idUser ?? this.idUser,
      eMail: eMail ?? this.eMail,
      passWord: passWord ?? this.passWord,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUser.present) {
      map['id_user'] = Variable<int>(idUser.value);
    }
    if (eMail.present) {
      map['e_mail'] = Variable<String>(eMail.value);
    }
    if (passWord.present) {
      map['pass_word'] = Variable<String>(passWord.value);
    }
    return map;
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idUserMeta = const VerificationMeta('idUser');
  GeneratedIntColumn _idUser;
  @override
  GeneratedIntColumn get idUser => _idUser ??= _constructIdUser();
  GeneratedIntColumn _constructIdUser() {
    return GeneratedIntColumn('id_user', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _eMailMeta = const VerificationMeta('eMail');
  GeneratedTextColumn _eMail;
  @override
  GeneratedTextColumn get eMail => _eMail ??= _constructEMail();
  GeneratedTextColumn _constructEMail() {
    return GeneratedTextColumn(
      'e_mail',
      $tableName,
      false,
    );
  }

  final VerificationMeta _passWordMeta = const VerificationMeta('passWord');
  GeneratedTextColumn _passWord;
  @override
  GeneratedTextColumn get passWord => _passWord ??= _constructPassWord();
  GeneratedTextColumn _constructPassWord() {
    return GeneratedTextColumn(
      'pass_word',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [idUser, eMail, passWord];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_user')) {
      context.handle(_idUserMeta,
          idUser.isAcceptableOrUnknown(data['id_user'], _idUserMeta));
    }
    if (data.containsKey('e_mail')) {
      context.handle(
          _eMailMeta, eMail.isAcceptableOrUnknown(data['e_mail'], _eMailMeta));
    } else if (isInserting) {
      context.missing(_eMailMeta);
    }
    if (data.containsKey('pass_word')) {
      context.handle(_passWordMeta,
          passWord.isAcceptableOrUnknown(data['pass_word'], _passWordMeta));
    } else if (isInserting) {
      context.missing(_passWordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUser};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Site extends DataClass implements Insertable<Site> {
  final int idSite;
  final String nameSite;
  final String address;
  final int numberBarn;
  final String userEmail;
  final DateTime dateSite;
  final int totalCount;
  Site(
      {this.idSite,
      @required this.nameSite,
      @required this.address,
      @required this.numberBarn,
      @required this.userEmail,
      @required this.dateSite,
      @required this.totalCount});
  factory Site.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Site(
      idSite:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_site']),
      nameSite: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}name_site']),
      address:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}address']),
      numberBarn: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}number_barn']),
      userEmail: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}user_email']),
      dateSite: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_site']),
      totalCount: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_count']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idSite != null) {
      map['id_site'] = Variable<int>(idSite);
    }
    if (!nullToAbsent || nameSite != null) {
      map['name_site'] = Variable<String>(nameSite);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || numberBarn != null) {
      map['number_barn'] = Variable<int>(numberBarn);
    }
    if (!nullToAbsent || userEmail != null) {
      map['user_email'] = Variable<String>(userEmail);
    }
    if (!nullToAbsent || dateSite != null) {
      map['date_site'] = Variable<DateTime>(dateSite);
    }
    if (!nullToAbsent || totalCount != null) {
      map['total_count'] = Variable<int>(totalCount);
    }
    return map;
  }

  SitesCompanion toCompanion(bool nullToAbsent) {
    return SitesCompanion(
      idSite:
          idSite == null && nullToAbsent ? const Value.absent() : Value(idSite),
      nameSite: nameSite == null && nullToAbsent
          ? const Value.absent()
          : Value(nameSite),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      numberBarn: numberBarn == null && nullToAbsent
          ? const Value.absent()
          : Value(numberBarn),
      userEmail: userEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(userEmail),
      dateSite: dateSite == null && nullToAbsent
          ? const Value.absent()
          : Value(dateSite),
      totalCount: totalCount == null && nullToAbsent
          ? const Value.absent()
          : Value(totalCount),
    );
  }

  factory Site.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Site(
      idSite: serializer.fromJson<int>(json['idSite']),
      nameSite: serializer.fromJson<String>(json['nameSite']),
      address: serializer.fromJson<String>(json['address']),
      numberBarn: serializer.fromJson<int>(json['numberBarn']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      dateSite: serializer.fromJson<DateTime>(json['dateSite']),
      totalCount: serializer.fromJson<int>(json['totalCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSite': serializer.toJson<int>(idSite),
      'nameSite': serializer.toJson<String>(nameSite),
      'address': serializer.toJson<String>(address),
      'numberBarn': serializer.toJson<int>(numberBarn),
      'userEmail': serializer.toJson<String>(userEmail),
      'dateSite': serializer.toJson<DateTime>(dateSite),
      'totalCount': serializer.toJson<int>(totalCount),
    };
  }

  Site copyWith(
          {int idSite,
          String nameSite,
          String address,
          int numberBarn,
          String userEmail,
          DateTime dateSite,
          int totalCount}) =>
      Site(
        idSite: idSite ?? this.idSite,
        nameSite: nameSite ?? this.nameSite,
        address: address ?? this.address,
        numberBarn: numberBarn ?? this.numberBarn,
        userEmail: userEmail ?? this.userEmail,
        dateSite: dateSite ?? this.dateSite,
        totalCount: totalCount ?? this.totalCount,
      );
  @override
  String toString() {
    return (StringBuffer('Site(')
          ..write('idSite: $idSite, ')
          ..write('nameSite: $nameSite, ')
          ..write('address: $address, ')
          ..write('numberBarn: $numberBarn, ')
          ..write('userEmail: $userEmail, ')
          ..write('dateSite: $dateSite, ')
          ..write('totalCount: $totalCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      idSite.hashCode,
      $mrjc(
          nameSite.hashCode,
          $mrjc(
              address.hashCode,
              $mrjc(
                  numberBarn.hashCode,
                  $mrjc(userEmail.hashCode,
                      $mrjc(dateSite.hashCode, totalCount.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Site &&
          other.idSite == this.idSite &&
          other.nameSite == this.nameSite &&
          other.address == this.address &&
          other.numberBarn == this.numberBarn &&
          other.userEmail == this.userEmail &&
          other.dateSite == this.dateSite &&
          other.totalCount == this.totalCount);
}

class SitesCompanion extends UpdateCompanion<Site> {
  final Value<int> idSite;
  final Value<String> nameSite;
  final Value<String> address;
  final Value<int> numberBarn;
  final Value<String> userEmail;
  final Value<DateTime> dateSite;
  final Value<int> totalCount;
  const SitesCompanion({
    this.idSite = const Value.absent(),
    this.nameSite = const Value.absent(),
    this.address = const Value.absent(),
    this.numberBarn = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.dateSite = const Value.absent(),
    this.totalCount = const Value.absent(),
  });
  SitesCompanion.insert({
    this.idSite = const Value.absent(),
    @required String nameSite,
    @required String address,
    @required int numberBarn,
    @required String userEmail,
    @required DateTime dateSite,
    @required int totalCount,
  })  : nameSite = Value(nameSite),
        address = Value(address),
        numberBarn = Value(numberBarn),
        userEmail = Value(userEmail),
        dateSite = Value(dateSite),
        totalCount = Value(totalCount);
  static Insertable<Site> custom({
    Expression<int> idSite,
    Expression<String> nameSite,
    Expression<String> address,
    Expression<int> numberBarn,
    Expression<String> userEmail,
    Expression<DateTime> dateSite,
    Expression<int> totalCount,
  }) {
    return RawValuesInsertable({
      if (idSite != null) 'id_site': idSite,
      if (nameSite != null) 'name_site': nameSite,
      if (address != null) 'address': address,
      if (numberBarn != null) 'number_barn': numberBarn,
      if (userEmail != null) 'user_email': userEmail,
      if (dateSite != null) 'date_site': dateSite,
      if (totalCount != null) 'total_count': totalCount,
    });
  }

  SitesCompanion copyWith(
      {Value<int> idSite,
      Value<String> nameSite,
      Value<String> address,
      Value<int> numberBarn,
      Value<String> userEmail,
      Value<DateTime> dateSite,
      Value<int> totalCount}) {
    return SitesCompanion(
      idSite: idSite ?? this.idSite,
      nameSite: nameSite ?? this.nameSite,
      address: address ?? this.address,
      numberBarn: numberBarn ?? this.numberBarn,
      userEmail: userEmail ?? this.userEmail,
      dateSite: dateSite ?? this.dateSite,
      totalCount: totalCount ?? this.totalCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSite.present) {
      map['id_site'] = Variable<int>(idSite.value);
    }
    if (nameSite.present) {
      map['name_site'] = Variable<String>(nameSite.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (numberBarn.present) {
      map['number_barn'] = Variable<int>(numberBarn.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (dateSite.present) {
      map['date_site'] = Variable<DateTime>(dateSite.value);
    }
    if (totalCount.present) {
      map['total_count'] = Variable<int>(totalCount.value);
    }
    return map;
  }
}

class $SitesTable extends Sites with TableInfo<$SitesTable, Site> {
  final GeneratedDatabase _db;
  final String _alias;
  $SitesTable(this._db, [this._alias]);
  final VerificationMeta _idSiteMeta = const VerificationMeta('idSite');
  GeneratedIntColumn _idSite;
  @override
  GeneratedIntColumn get idSite => _idSite ??= _constructIdSite();
  GeneratedIntColumn _constructIdSite() {
    return GeneratedIntColumn('id_site', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameSiteMeta = const VerificationMeta('nameSite');
  GeneratedTextColumn _nameSite;
  @override
  GeneratedTextColumn get nameSite => _nameSite ??= _constructNameSite();
  GeneratedTextColumn _constructNameSite() {
    return GeneratedTextColumn(
      'name_site',
      $tableName,
      false,
    );
  }

  final VerificationMeta _addressMeta = const VerificationMeta('address');
  GeneratedTextColumn _address;
  @override
  GeneratedTextColumn get address => _address ??= _constructAddress();
  GeneratedTextColumn _constructAddress() {
    return GeneratedTextColumn(
      'address',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberBarnMeta = const VerificationMeta('numberBarn');
  GeneratedIntColumn _numberBarn;
  @override
  GeneratedIntColumn get numberBarn => _numberBarn ??= _constructNumberBarn();
  GeneratedIntColumn _constructNumberBarn() {
    return GeneratedIntColumn(
      'number_barn',
      $tableName,
      false,
    );
  }

  final VerificationMeta _userEmailMeta = const VerificationMeta('userEmail');
  GeneratedTextColumn _userEmail;
  @override
  GeneratedTextColumn get userEmail => _userEmail ??= _constructUserEmail();
  GeneratedTextColumn _constructUserEmail() {
    return GeneratedTextColumn(
      'user_email',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateSiteMeta = const VerificationMeta('dateSite');
  GeneratedDateTimeColumn _dateSite;
  @override
  GeneratedDateTimeColumn get dateSite => _dateSite ??= _constructDateSite();
  GeneratedDateTimeColumn _constructDateSite() {
    return GeneratedDateTimeColumn(
      'date_site',
      $tableName,
      false,
    );
  }

  final VerificationMeta _totalCountMeta = const VerificationMeta('totalCount');
  GeneratedIntColumn _totalCount;
  @override
  GeneratedIntColumn get totalCount => _totalCount ??= _constructTotalCount();
  GeneratedIntColumn _constructTotalCount() {
    return GeneratedIntColumn(
      'total_count',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [idSite, nameSite, address, numberBarn, userEmail, dateSite, totalCount];
  @override
  $SitesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'sites';
  @override
  final String actualTableName = 'sites';
  @override
  VerificationContext validateIntegrity(Insertable<Site> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_site')) {
      context.handle(_idSiteMeta,
          idSite.isAcceptableOrUnknown(data['id_site'], _idSiteMeta));
    }
    if (data.containsKey('name_site')) {
      context.handle(_nameSiteMeta,
          nameSite.isAcceptableOrUnknown(data['name_site'], _nameSiteMeta));
    } else if (isInserting) {
      context.missing(_nameSiteMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address'], _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('number_barn')) {
      context.handle(
          _numberBarnMeta,
          numberBarn.isAcceptableOrUnknown(
              data['number_barn'], _numberBarnMeta));
    } else if (isInserting) {
      context.missing(_numberBarnMeta);
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email'], _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('date_site')) {
      context.handle(_dateSiteMeta,
          dateSite.isAcceptableOrUnknown(data['date_site'], _dateSiteMeta));
    } else if (isInserting) {
      context.missing(_dateSiteMeta);
    }
    if (data.containsKey('total_count')) {
      context.handle(
          _totalCountMeta,
          totalCount.isAcceptableOrUnknown(
              data['total_count'], _totalCountMeta));
    } else if (isInserting) {
      context.missing(_totalCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSite};
  @override
  Site map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Site.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SitesTable createAlias(String alias) {
    return $SitesTable(_db, alias);
  }
}

class Barn extends DataClass implements Insertable<Barn> {
  final int idBarn;
  final String nameBarn;
  final int numberPen;
  final int siteId;
  final DateTime dateBarn;
  Barn(
      {this.idBarn,
      @required this.nameBarn,
      @required this.numberPen,
      @required this.siteId,
      @required this.dateBarn});
  factory Barn.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Barn(
      idBarn:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_barn']),
      nameBarn: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}name_barn']),
      numberPen:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}number_pen']),
      siteId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}site_id']),
      dateBarn: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_barn']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || idBarn != null) {
      map['id_barn'] = Variable<int>(idBarn);
    }
    if (!nullToAbsent || nameBarn != null) {
      map['name_barn'] = Variable<String>(nameBarn);
    }
    if (!nullToAbsent || numberPen != null) {
      map['number_pen'] = Variable<int>(numberPen);
    }
    if (!nullToAbsent || siteId != null) {
      map['site_id'] = Variable<int>(siteId);
    }
    if (!nullToAbsent || dateBarn != null) {
      map['date_barn'] = Variable<DateTime>(dateBarn);
    }
    return map;
  }

  BarnsCompanion toCompanion(bool nullToAbsent) {
    return BarnsCompanion(
      idBarn:
          idBarn == null && nullToAbsent ? const Value.absent() : Value(idBarn),
      nameBarn: nameBarn == null && nullToAbsent
          ? const Value.absent()
          : Value(nameBarn),
      numberPen: numberPen == null && nullToAbsent
          ? const Value.absent()
          : Value(numberPen),
      siteId:
          siteId == null && nullToAbsent ? const Value.absent() : Value(siteId),
      dateBarn: dateBarn == null && nullToAbsent
          ? const Value.absent()
          : Value(dateBarn),
    );
  }

  factory Barn.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Barn(
      idBarn: serializer.fromJson<int>(json['idBarn']),
      nameBarn: serializer.fromJson<String>(json['nameBarn']),
      numberPen: serializer.fromJson<int>(json['numberPen']),
      siteId: serializer.fromJson<int>(json['siteId']),
      dateBarn: serializer.fromJson<DateTime>(json['dateBarn']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idBarn': serializer.toJson<int>(idBarn),
      'nameBarn': serializer.toJson<String>(nameBarn),
      'numberPen': serializer.toJson<int>(numberPen),
      'siteId': serializer.toJson<int>(siteId),
      'dateBarn': serializer.toJson<DateTime>(dateBarn),
    };
  }

  Barn copyWith(
          {int idBarn,
          String nameBarn,
          int numberPen,
          int siteId,
          DateTime dateBarn}) =>
      Barn(
        idBarn: idBarn ?? this.idBarn,
        nameBarn: nameBarn ?? this.nameBarn,
        numberPen: numberPen ?? this.numberPen,
        siteId: siteId ?? this.siteId,
        dateBarn: dateBarn ?? this.dateBarn,
      );
  @override
  String toString() {
    return (StringBuffer('Barn(')
          ..write('idBarn: $idBarn, ')
          ..write('nameBarn: $nameBarn, ')
          ..write('numberPen: $numberPen, ')
          ..write('siteId: $siteId, ')
          ..write('dateBarn: $dateBarn')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      idBarn.hashCode,
      $mrjc(
          nameBarn.hashCode,
          $mrjc(
              numberPen.hashCode, $mrjc(siteId.hashCode, dateBarn.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Barn &&
          other.idBarn == this.idBarn &&
          other.nameBarn == this.nameBarn &&
          other.numberPen == this.numberPen &&
          other.siteId == this.siteId &&
          other.dateBarn == this.dateBarn);
}

class BarnsCompanion extends UpdateCompanion<Barn> {
  final Value<int> idBarn;
  final Value<String> nameBarn;
  final Value<int> numberPen;
  final Value<int> siteId;
  final Value<DateTime> dateBarn;
  const BarnsCompanion({
    this.idBarn = const Value.absent(),
    this.nameBarn = const Value.absent(),
    this.numberPen = const Value.absent(),
    this.siteId = const Value.absent(),
    this.dateBarn = const Value.absent(),
  });
  BarnsCompanion.insert({
    this.idBarn = const Value.absent(),
    @required String nameBarn,
    @required int numberPen,
    @required int siteId,
    @required DateTime dateBarn,
  })  : nameBarn = Value(nameBarn),
        numberPen = Value(numberPen),
        siteId = Value(siteId),
        dateBarn = Value(dateBarn);
  static Insertable<Barn> custom({
    Expression<int> idBarn,
    Expression<String> nameBarn,
    Expression<int> numberPen,
    Expression<int> siteId,
    Expression<DateTime> dateBarn,
  }) {
    return RawValuesInsertable({
      if (idBarn != null) 'id_barn': idBarn,
      if (nameBarn != null) 'name_barn': nameBarn,
      if (numberPen != null) 'number_pen': numberPen,
      if (siteId != null) 'site_id': siteId,
      if (dateBarn != null) 'date_barn': dateBarn,
    });
  }

  BarnsCompanion copyWith(
      {Value<int> idBarn,
      Value<String> nameBarn,
      Value<int> numberPen,
      Value<int> siteId,
      Value<DateTime> dateBarn}) {
    return BarnsCompanion(
      idBarn: idBarn ?? this.idBarn,
      nameBarn: nameBarn ?? this.nameBarn,
      numberPen: numberPen ?? this.numberPen,
      siteId: siteId ?? this.siteId,
      dateBarn: dateBarn ?? this.dateBarn,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idBarn.present) {
      map['id_barn'] = Variable<int>(idBarn.value);
    }
    if (nameBarn.present) {
      map['name_barn'] = Variable<String>(nameBarn.value);
    }
    if (numberPen.present) {
      map['number_pen'] = Variable<int>(numberPen.value);
    }
    if (siteId.present) {
      map['site_id'] = Variable<int>(siteId.value);
    }
    if (dateBarn.present) {
      map['date_barn'] = Variable<DateTime>(dateBarn.value);
    }
    return map;
  }
}

class $BarnsTable extends Barns with TableInfo<$BarnsTable, Barn> {
  final GeneratedDatabase _db;
  final String _alias;
  $BarnsTable(this._db, [this._alias]);
  final VerificationMeta _idBarnMeta = const VerificationMeta('idBarn');
  GeneratedIntColumn _idBarn;
  @override
  GeneratedIntColumn get idBarn => _idBarn ??= _constructIdBarn();
  GeneratedIntColumn _constructIdBarn() {
    return GeneratedIntColumn('id_barn', $tableName, true,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameBarnMeta = const VerificationMeta('nameBarn');
  GeneratedTextColumn _nameBarn;
  @override
  GeneratedTextColumn get nameBarn => _nameBarn ??= _constructNameBarn();
  GeneratedTextColumn _constructNameBarn() {
    return GeneratedTextColumn(
      'name_barn',
      $tableName,
      false,
    );
  }

  final VerificationMeta _numberPenMeta = const VerificationMeta('numberPen');
  GeneratedIntColumn _numberPen;
  @override
  GeneratedIntColumn get numberPen => _numberPen ??= _constructNumberPen();
  GeneratedIntColumn _constructNumberPen() {
    return GeneratedIntColumn(
      'number_pen',
      $tableName,
      false,
    );
  }

  final VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  GeneratedIntColumn _siteId;
  @override
  GeneratedIntColumn get siteId => _siteId ??= _constructSiteId();
  GeneratedIntColumn _constructSiteId() {
    return GeneratedIntColumn(
      'site_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _dateBarnMeta = const VerificationMeta('dateBarn');
  GeneratedDateTimeColumn _dateBarn;
  @override
  GeneratedDateTimeColumn get dateBarn => _dateBarn ??= _constructDateBarn();
  GeneratedDateTimeColumn _constructDateBarn() {
    return GeneratedDateTimeColumn(
      'date_barn',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [idBarn, nameBarn, numberPen, siteId, dateBarn];
  @override
  $BarnsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'barns';
  @override
  final String actualTableName = 'barns';
  @override
  VerificationContext validateIntegrity(Insertable<Barn> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_barn')) {
      context.handle(_idBarnMeta,
          idBarn.isAcceptableOrUnknown(data['id_barn'], _idBarnMeta));
    }
    if (data.containsKey('name_barn')) {
      context.handle(_nameBarnMeta,
          nameBarn.isAcceptableOrUnknown(data['name_barn'], _nameBarnMeta));
    } else if (isInserting) {
      context.missing(_nameBarnMeta);
    }
    if (data.containsKey('number_pen')) {
      context.handle(_numberPenMeta,
          numberPen.isAcceptableOrUnknown(data['number_pen'], _numberPenMeta));
    } else if (isInserting) {
      context.missing(_numberPenMeta);
    }
    if (data.containsKey('site_id')) {
      context.handle(_siteIdMeta,
          siteId.isAcceptableOrUnknown(data['site_id'], _siteIdMeta));
    } else if (isInserting) {
      context.missing(_siteIdMeta);
    }
    if (data.containsKey('date_barn')) {
      context.handle(_dateBarnMeta,
          dateBarn.isAcceptableOrUnknown(data['date_barn'], _dateBarnMeta));
    } else if (isInserting) {
      context.missing(_dateBarnMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idBarn};
  @override
  Barn map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Barn.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BarnsTable createAlias(String alias) {
    return $BarnsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $SitesTable _sites;
  $SitesTable get sites => _sites ??= $SitesTable(this);
  $BarnsTable _barns;
  $BarnsTable get barns => _barns ??= $BarnsTable(this);
  UserDao _userDao;
  UserDao get userDao => _userDao ??= UserDao(this as AppDatabase);
  SiteDao _siteDao;
  SiteDao get siteDao => _siteDao ??= SiteDao(this as AppDatabase);
  BarnDao _barnDao;
  BarnDao get barnDao => _barnDao ??= BarnDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, sites, barns];
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileStore on _EditProfileStoreBase, Store {
  final _$loadingAtom = Atom(name: '_EditProfileStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_EditProfileStoreBaseActionController =
      ActionController(name: '_EditProfileStoreBase');

  @override
  dynamic startLoading() {
    final _$actionInfo = _$_EditProfileStoreBaseActionController.startAction(
        name: '_EditProfileStoreBase.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_EditProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stopLoading() {
    final _$actionInfo = _$_EditProfileStoreBaseActionController.startAction(
        name: '_EditProfileStoreBase.stopLoading');
    try {
      return super.stopLoading();
    } finally {
      _$_EditProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic populateFields() {
    final _$actionInfo = _$_EditProfileStoreBaseActionController.startAction(
        name: '_EditProfileStoreBase.populateFields');
    try {
      return super.populateFields();
    } finally {
      _$_EditProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}

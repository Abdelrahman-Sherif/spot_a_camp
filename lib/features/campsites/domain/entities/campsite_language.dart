import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spot_a_camp/core/barrel.dart';

part 'campsite_language.freezed.dart';

enum CampingSiteLanguageEnum { en, de }

@freezed
sealed class CampsiteLanguage with _$CampsiteLanguage {
  const factory CampsiteLanguage.enumValue(CampingSiteLanguageEnum value) =
      CampsiteLanguageEnum;

  const factory CampsiteLanguage.string(String value) = CampsiteLanguageString;
}

extension CampsiteLanguageExtension on CampsiteLanguage {
  String label({required AppLocalizations l10n}) => switch (this) {
    CampsiteLanguageEnum(value: var enumValue) => switch (enumValue) {
      CampingSiteLanguageEnum.en => l10n.en,
      CampingSiteLanguageEnum.de => l10n.de,
    },
    CampsiteLanguageString(value: var stringValue) => stringValue,
  };
}

enum TermsAgreementType { service, privacy, marketing }

class TermsAgreement {
  final bool service;
  final bool privacy;
  final bool marketing;

  const TermsAgreement({
    this.service = false,
    this.privacy = false,
    this.marketing = false,
  });

  bool get requiredAllChecked => service && privacy;

  bool get allChecked => requiredAllChecked && marketing;

  TermsAgreement copyWith({
    bool? service,
    bool? privacy,
    bool? marketing,
  }) {
    return TermsAgreement(
      service: service ?? this.service,
      privacy: privacy ?? this.privacy,
      marketing: marketing ?? this.marketing,
    );
  }

  TermsAgreement toggleAll(bool v) {
    return TermsAgreement(
      service: v,
      privacy: v,
      marketing: v,
    );
  }
}
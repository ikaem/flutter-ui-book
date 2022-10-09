enum ScreenType {
  desktop._(minWidth: 901),
  tablet._(minWidth: 601, maxWidth: 900),
  handset._(minWidth: 300, maxWidth: 600);

  // ok, so this would be some type of constructor
  const ScreenType._({
    this.minWidth,
    this.maxWidth,
  });

  final int? minWidth;
  final int? maxWidth;

  factory ScreenType.fromSize(double deviceWidth) {
    if (deviceWidth > ScreenType.tablet.maxWidth!) return ScreenType.desktop;

    // but handset is not defined with min widht
    if (deviceWidth > ScreenType.handset.minWidth!) return ScreenType.tablet;

    return ScreenType.handset;
  }
}

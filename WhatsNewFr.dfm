object WhatsNewFrm: TWhatsNewFrm
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'What'#39's New'
  ClientHeight = 327
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spSkinButton1: TspSkinButton
    Left = 290
    Top = 283
    Width = 75
    Height = 25
    HintImageIndex = 0
    TabOrder = 0
    DrawDefault = True
    SkinData = MainForm.spSkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    Transparent = False
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = True
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    TabStop = True
    CanFocused = True
    Down = False
    GroupIndex = 0
    Caption = 'OK'
    NumGlyphs = 1
    Spacing = 1
    ModalResult = 1
  end
  object spSkinButton2: TspSkinButton
    Left = 381
    Top = 283
    Width = 75
    Height = 25
    HintImageIndex = 0
    TabOrder = 1
    DrawDefault = True
    SkinData = MainForm.spSkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    Transparent = False
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = True
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    TabStop = True
    CanFocused = True
    Down = False
    GroupIndex = 0
    Caption = 'Cancel'
    NumGlyphs = 1
    Spacing = 1
    ModalResult = 2
  end
  object spSkinMemo1: TspSkinMemo
    Left = 0
    Top = 0
    Width = 477
    Height = 273
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 13
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    UseSkinFont = True
    UseSkinFontColor = True
    BitMapBG = True
    VScrollBar = spSkinScrollBar1
    SkinDataName = 'memo'
    Transparent = False
    WallpaperStretch = False
    AlphaBlend = False
    AlphaBlendValue = 0
  end
  object spSkinScrollBar1: TspSkinScrollBar
    Left = 456
    Top = 0
    Width = 19
    Height = 273
    HintImageIndex = 0
    TabOrder = 3
    DrawDefault = True
    SkinData = MainForm.spSkinData1
    SkinDataName = 'vscrollbar'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 19
    DefaultHeight = 0
    Both = False
    BothMarkerWidth = 0
    BothSkinDataName = 'bothhscrollbar'
    CanFocused = False
    Kind = sbVertical
    PageSize = 0
    Min = 0
    Max = 0
    Position = 0
    SmallChange = 1
    LargeChange = 20
  end
  object spDynamicSkinForm1: TspDynamicSkinForm
    UseRibbon = False
    MenuButtonVisible = False
    MenuButtonWidth = 50
    MenuButtonImageIndex = -1
    MenuButtonSpacing = 0
    MenuButtonMargin = -1
    WindowState = wsNormal
    ShowMDIScrollBars = True
    QuickButtons = <>
    CaptionTabs = <>
    CaptionTabIndex = 0
    CaptionTabPos = sptpLeft
    QuickButtonsShowHint = False
    ClientInActiveEffect = False
    ClientInActiveEffectType = spieSemiTransparent
    DisableSystemMenu = False
    PositionInMonitor = sppDefault
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    HideCloseButton = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    UseSkinFontInCaption = True
    UseSkinSizeInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    ShowObjectHint = False
    UseDefaultObjectHint = True
    UseSkinCursors = False
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 13
    DefCaptionFont.Name = 'Tahoma'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 13
    DefInActiveCaptionFont.Name = 'Tahoma'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 13
    DefMenuItemFont.Name = 'Tahoma'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SupportNCArea = True
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    AlphaBlend = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    SkinData = MainForm.spSkinData1
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    MinClientHeight = 0
    MinClientWidth = 0
    MaxClientHeight = 0
    MaxClientWidth = 0
    Sizeable = False
    DraggAble = False
    NCDraggAble = True
    Magnetic = False
    MagneticSize = 10
    BorderIcons = []
    Left = 16
    Top = 288
  end
  object IdFTP1: TIdFTP
    IPVersion = Id_IPv4
    Passive = True
    ConnectTimeout = 0
    ListenTimeout = 180000
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 56
    Top = 288
  end
  object spSkinMessage1: TspSkinMessage
    ShowAgainFlag = False
    ShowAgainFlagValue = False
    AlphaBlend = False
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    ButtonSkinDataName = 'button'
    MessageLabelSkinDataName = 'stdlabel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    DefaultButtonFont.Charset = DEFAULT_CHARSET
    DefaultButtonFont.Color = clWindowText
    DefaultButtonFont.Height = 13
    DefaultButtonFont.Name = 'Tahoma'
    DefaultButtonFont.Style = []
    UseSkinFont = True
    Left = 104
    Top = 288
  end
end

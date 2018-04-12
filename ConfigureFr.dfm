object frmConfigure: TfrmConfigure
  Left = 447
  Top = 194
  BorderIcons = []
  Caption = 'Configuration'
  ClientHeight = 396
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spSkinPageControl1: TspSkinPageControl
    Left = 9
    Top = 9
    Width = 305
    Height = 318
    ActivePage = spSkinTabSheet1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ButtonTabSkinDataName = 'resizetoolbutton'
    MouseWheelSupport = False
    TabsOffset = 0
    TabExtededDraw = False
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = False
    ShowCloseButtons = False
    TabsBGTransparent = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinData = MainForm.spSkinData1
    SkinDataName = 'tab'
    object spSkinTabSheet1: TspSkinTabSheet
      Caption = 'Directories'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spSkinListBox1: TspSkinListBox
        Left = 10
        Top = 9
        Width = 281
        Height = 217
        HintImageIndex = 0
        TabOrder = 0
        DrawDefault = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'captionlistbox'
        AlphaBlend = False
        AlphaBlendValue = 200
        UseSkinCursor = False
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ShowCaptionButtons = True
        UseSkinItemHeight = True
        HorizontalExtent = False
        Columns = 0
        RowCount = 0
        ImageIndex = 0
        NumGlyphs = 1
        Spacing = 2
        CaptionMode = True
        DefaultCaptionHeight = 20
        DefaultCaptionFont.Charset = DEFAULT_CHARSET
        DefaultCaptionFont.Color = clWindowText
        DefaultCaptionFont.Height = 14
        DefaultCaptionFont.Name = 'Arial'
        DefaultCaptionFont.Style = []
        DefaultItemHeight = 20
        Items.Strings = (
          'Working Directory'
          'Project Folder'
          'Hostoric WTH files folder'
          'Predicted WTG files folder')
        ItemIndex = -1
        MultiSelect = False
        ListBoxFont.Charset = DEFAULT_CHARSET
        ListBoxFont.Color = clWindowText
        ListBoxFont.Height = 14
        ListBoxFont.Name = 'Arial'
        ListBoxFont.Style = []
        ListBoxTabOrder = 0
        ListBoxTabStop = True
        ListBoxDragMode = dmManual
        ListBoxDragKind = dkDrag
        ListBoxDragCursor = crDrag
        ExtandedSelect = True
        Sorted = False
        Caption = 'Directories'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        OnListBoxClick = spSkinListBox1ListBoxClick
        OnListBoxDblClick = spSkinDirectoryEdit1ButtonClick
      end
      object spSkinDirectoryEdit1: TspSkinDirectoryEdit
        Left = 10
        Top = 235
        Width = 281
        Height = 20
        Text = ''
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'buttonedit'
        AlphaBlend = False
        AlphaBlendValue = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Images = MainForm.SmallImageList
        ButtonImageIndex = 3
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnButtonClick = spSkinDirectoryEdit1ButtonClick
        DlgTreeShowLines = True
        DlgTreeButtonExpandImageIndex = 0
        DlgTreeButtonNoExpandImageIndex = 1
        DlgShowToolBar = False
        DlgToolButtonImageIndex = 0
      end
    end
    object spSkinTabSheet2: TspSkinTabSheet
      Caption = 'Files'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spSkinListBox2: TspSkinListBox
        Left = 10
        Top = 9
        Width = 281
        Height = 217
        HintImageIndex = 0
        TabOrder = 0
        DrawDefault = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'captionlistbox'
        AlphaBlend = False
        AlphaBlendValue = 200
        UseSkinCursor = False
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ShowCaptionButtons = True
        UseSkinItemHeight = True
        HorizontalExtent = False
        Columns = 0
        RowCount = 0
        ImageIndex = -1
        NumGlyphs = 1
        Spacing = 2
        CaptionMode = True
        DefaultCaptionHeight = 20
        DefaultCaptionFont.Charset = DEFAULT_CHARSET
        DefaultCaptionFont.Color = clWindowText
        DefaultCaptionFont.Height = 14
        DefaultCaptionFont.Name = 'Arial'
        DefaultCaptionFont.Style = []
        DefaultItemHeight = 20
        Items.Strings = (
          'Cold Years File'
          'Neutral Years File'
          'Warm Years File'
          'Text Editor')
        ItemIndex = -1
        MultiSelect = False
        ListBoxFont.Charset = DEFAULT_CHARSET
        ListBoxFont.Color = clWindowText
        ListBoxFont.Height = 14
        ListBoxFont.Name = 'Arial'
        ListBoxFont.Style = []
        ListBoxTabOrder = 0
        ListBoxTabStop = True
        ListBoxDragMode = dmManual
        ListBoxDragKind = dkDrag
        ListBoxDragCursor = crDrag
        ExtandedSelect = True
        Sorted = False
        Caption = 'Files'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        OnListBoxClick = spSkinListBox2ListBoxClick
      end
      object spSkinFileEdit1: TspSkinFileEdit
        Left = 10
        Top = 235
        Width = 281
        Height = 20
        Text = ''
        DefaultColor = clWindow
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clBlack
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ButtonMode = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'buttonedit'
        AlphaBlend = False
        AlphaBlendValue = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Images = MainForm.SmallImageList
        ButtonImageIndex = 3
        LeftImageIndex = -1
        LeftImageHotIndex = -1
        LeftImageDownIndex = -1
        RightImageIndex = -1
        RightImageHotIndex = -1
        RightImageDownIndex = -1
        OnButtonClick = spSkinFileEdit1ButtonClick
        Filter = 'All files|*.*'
        LVHeaderSkinDataName = 'resizebutton'
      end
    end
    object spSkinTabSheet3: TspSkinTabSheet
      Caption = 'Settings'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spSkinListBox3: TspSkinListBox
        Left = 10
        Top = 9
        Width = 281
        Height = 217
        HintImageIndex = 0
        TabOrder = 0
        DrawDefault = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'captionlistbox'
        AlphaBlend = False
        AlphaBlendValue = 200
        UseSkinCursor = False
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        ShowCaptionButtons = True
        UseSkinItemHeight = True
        HorizontalExtent = False
        Columns = 0
        RowCount = 0
        ImageIndex = -1
        NumGlyphs = 1
        Spacing = 2
        CaptionMode = True
        DefaultCaptionHeight = 20
        DefaultCaptionFont.Charset = DEFAULT_CHARSET
        DefaultCaptionFont.Color = clWindowText
        DefaultCaptionFont.Height = 14
        DefaultCaptionFont.Name = 'Arial'
        DefaultCaptionFont.Style = []
        DefaultItemHeight = 20
        Items.Strings = (
          'Contact Email')
        ItemIndex = -1
        MultiSelect = False
        ListBoxFont.Charset = DEFAULT_CHARSET
        ListBoxFont.Color = clWindowText
        ListBoxFont.Height = 14
        ListBoxFont.Name = 'Arial'
        ListBoxFont.Style = []
        ListBoxTabOrder = 0
        ListBoxTabStop = True
        ListBoxDragMode = dmManual
        ListBoxDragKind = dkDrag
        ListBoxDragCursor = crDrag
        ExtandedSelect = True
        Sorted = False
        Caption = 'Settings'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 14
        Font.Name = 'Arial'
        Font.Style = []
        OnListBoxClick = spSkinListBox3ListBoxClick
        OnListBoxDblClick = spSkinLabel1Click
      end
      object spSkinLabel1: TspSkinLabel
        Left = 10
        Top = 235
        Width = 281
        Height = 21
        HintImageIndex = 0
        TabOrder = 1
        DrawDefault = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'label'
        AlphaBlend = False
        AlphaBlendValue = 200
        UseSkinCursor = False
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        Transparent = False
        ShadowEffect = False
        ShadowColor = clBlack
        ShadowOffset = 0
        ShadowSize = 3
        ReflectionEffect = False
        ReflectionOffset = -5
        EllipsType = spetNoneEllips
        UseSkinSize = True
        UseSkinFontColor = True
        BorderStyle = bvFrame
        AutoSize = False
        OnClick = spSkinLabel1Click
      end
    end
    object spSkinTabSheet4: TspSkinTabSheet
      Caption = 'Utility'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object spSkinGroupBox1: TspSkinGroupBox
        Left = 10
        Top = 9
        Width = 281
        Height = 217
        HintImageIndex = 0
        TabOrder = 0
        DrawDefault = True
        SkinData = MainForm.spSkinData1
        SkinDataName = 'groupbox'
        AlphaBlend = False
        AlphaBlendValue = 200
        UseSkinCursor = False
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 14
        DefaultFont.Name = 'Arial'
        DefaultFont.Style = []
        UseSkinFont = True
        DefaultWidth = 0
        DefaultHeight = 0
        EmptyDrawing = False
        RibbonStyle = False
        ImagePosition = spipDefault
        TransparentMode = False
        CaptionImageIndex = -1
        RealHeight = -1
        AutoEnabledControls = True
        CheckedMode = False
        Checked = False
        NumGlyphs = 1
        Spacing = 2
        DefaultAlignment = taLeftJustify
        DefaultCaptionHeight = 22
        BorderStyle = bvFrame
        CaptionMode = True
        RollUpMode = False
        RollUpState = False
        Caption = 'Utility'
        UseSkinSize = True
        object spSkinStdLabel1: TspSkinStdLabel
          Left = 8
          Top = 34
          Width = 50
          Height = 13
          EllipsType = spetNone
          UseSkinFont = True
          UseSkinColor = True
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = -11
          DefaultFont.Name = 'MS Sans Serif'
          DefaultFont.Style = []
          SkinData = MainForm.spSkinData1
          SkinDataName = 'stdlabel'
          Caption = 'Skin name'
        end
        object spSkinFileEdit2: TspSkinFileEdit
          Left = 64
          Top = 31
          Width = 209
          Height = 20
          Text = ''
          DefaultColor = clWindow
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clBlack
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          UseSkinFont = True
          DefaultWidth = 0
          DefaultHeight = 0
          ButtonMode = True
          SkinData = MainForm.spSkinData1
          SkinDataName = 'buttonedit'
          AlphaBlend = False
          AlphaBlendValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = 14
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          ButtonImageIndex = -1
          LeftImageIndex = -1
          LeftImageHotIndex = -1
          LeftImageDownIndex = -1
          RightImageIndex = -1
          RightImageHotIndex = -1
          RightImageDownIndex = -1
          OnButtonClick = spSkinButton4Click
          Filter = 'SKins|*.skn'
          LVHeaderSkinDataName = 'resizebutton'
        end
        object spSkinButtonGroup1: TspSkinButtonGroup
          Left = 64
          Top = 88
          Width = 49
          Height = 25
          HintImageIndex = 0
          TabOrder = 1
          DrawDefault = True
          SkinData = MainForm.spSkinData1
          SkinDataName = 'panel'
          AlphaBlend = False
          AlphaBlendValue = 200
          UseSkinCursor = False
          ButtonsSkinDataName = 'resizebutton'
          UseSkinFont = True
          ShowBoder = False
          ShowFocus = False
          Images = ImageList1
          Items = <
            item
              Hint = 'Print Setup'
              ImageIndex = 0
              OnClick = spSkinButtonGroup1Items1Click
            end
            item
              Hint = 'International Settings'
              ImageIndex = 2
              OnClick = spSkinButtonGroup1Items2Click
            end>
          ShowHint = True
        end
      end
    end
  end
  object btnCancel: TspSkinButton
    Left = 238
    Top = 336
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
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
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
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    Spacing = 1
    ModalResult = 2
    OnClick = btnCancelClick
  end
  object btnSave: TspSkinButton
    Left = 160
    Top = 336
    Width = 75
    Height = 25
    HintImageIndex = 0
    TabOrder = 2
    DrawDefault = True
    SkinData = MainForm.spSkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
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
    Caption = 'Save'
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
    Spacing = 1
    ModalResult = 1
    OnClick = btnSaveClick
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
    ShowIcon = True
    MaximizeOnFullScreen = False
    ShowObjectHint = False
    UseDefaultObjectHint = True
    UseSkinCursors = False
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
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
    MenusSkinData = MainForm.spSkinData1
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
    BorderIcons = [biSystemMenu, biRollUp]
    Left = 112
    Top = 355
  end
  object spSkinSelectDirectoryDialog1: TspSkinSelectDirectoryDialog
    TreeShowLines = True
    TreeButtonExpandImageIndex = 0
    TreeButtonNoExpandImageIndex = 1
    ToolButtonImageIndex = 0
    ToolButtonsTransparent = False
    DialogWidth = 350
    DialogHeight = 400
    DialogMinWidth = 0
    DialogMinHeight = 0
    AlphaBlend = False
    AlphaBlendValue = 200
    AlphaBlendAnimation = False
    SkinData = MainForm.spSkinData1
    CtrlSkinData = MainForm.spSkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Title = 'Select folder'
    ShowToolBar = True
    Left = 80
    Top = 355
  end
  object spSkinOpenDialog1: TspSkinOpenDialog
    ShowThumbnails = True
    ShowHiddenFiles = False
    ToolButtonsTransparent = False
    OverwritePromt = False
    DialogWidth = 350
    DialogHeight = 400
    DialogMinWidth = 0
    DialogMinHeight = 0
    CheckFileExists = True
    MultiSelection = False
    AlphaBlend = False
    AlphaBlendValue = 225
    AlphaBlendAnimation = False
    CtrlAlphaBlend = False
    CtrlAlphaBlendValue = 225
    CtrlAlphaBlendAnimation = False
    LVHeaderSkinDataName = 'resizebutton'
    SkinData = MainForm.spSkinData1
    CtrlSkinData = MainForm.spSkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Title = 'Open file'
    Filter = 'All files|*.*'
    FilterIndex = 1
    Left = 48
    Top = 355
  end
  object spSkinInputDialog1: TspSkinInputDialog
    AlphaBlend = False
    AlphaBlendValue = 225
    AlphaBlendAnimation = False
    SkinData = MainForm.spSkinData1
    CtrlSkinData = MainForm.spSkinData1
    ButtonSkinDataName = 'button'
    LabelSkinDataName = 'stdlabel'
    EditSkinDataName = 'edit'
    DefaultLabelFont.Charset = DEFAULT_CHARSET
    DefaultLabelFont.Color = clWindowText
    DefaultLabelFont.Height = 14
    DefaultLabelFont.Name = 'Arial'
    DefaultLabelFont.Style = []
    DefaultButtonFont.Charset = DEFAULT_CHARSET
    DefaultButtonFont.Color = clWindowText
    DefaultButtonFont.Height = 14
    DefaultButtonFont.Name = 'Arial'
    DefaultButtonFont.Style = []
    DefaultEditFont.Charset = DEFAULT_CHARSET
    DefaultEditFont.Color = clWindowText
    DefaultEditFont.Height = 14
    DefaultEditFont.Name = 'Arial'
    DefaultEditFont.Style = []
    UseSkinFont = True
    Left = 16
    Top = 355
  end
  object spSkinPrinterSetupDialog1: TspSkinPrinterSetupDialog
    GroupBoxTransparentMode = False
    Title = 'Print setup'
    AlphaBlend = False
    AlphaBlendValue = 200
    AlphaBlendAnimation = False
    SkinData = MainForm.spSkinData1
    ButtonSkinDataName = 'button'
    LabelSkinDataName = 'stdlabel'
    ComboboxSkinDataName = 'combobox'
    DefaultLabelFont.Charset = DEFAULT_CHARSET
    DefaultLabelFont.Color = clWindowText
    DefaultLabelFont.Height = 14
    DefaultLabelFont.Name = 'Arial'
    DefaultLabelFont.Style = []
    DefaultButtonFont.Charset = DEFAULT_CHARSET
    DefaultButtonFont.Color = clWindowText
    DefaultButtonFont.Height = 14
    DefaultButtonFont.Name = 'Arial'
    DefaultButtonFont.Style = []
    DefaultComboBoxFont.Charset = DEFAULT_CHARSET
    DefaultComboBoxFont.Color = clWindowText
    DefaultComboBoxFont.Height = 14
    DefaultComboBoxFont.Name = 'Arial'
    DefaultComboBoxFont.Style = []
    UseSkinFont = True
    Left = 144
    Top = 355
  end
  object ImageList1: TImageList
    Left = 176
    Top = 355
    Bitmap = {
      494C010103000400340010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000000000000000000000000009C9C9C009C9C
      9C00A5A5A5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADADA5008C8C8C006B6B
      6B00BDB5AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400DEDEDE00ADA5A500525252006B6B6B00ADADAD00CECE
      CE00DEDEDE009C9C9C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ADA59C009C522900844A
      210073422100633921004A4A4A00BDB5AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400F7F7F700FFFFFF00DEDEDE00B5ADAD005A5A630031313100313131005252
      5200848484009C9C9C00A5A5A500000000000000000000000000000000008484
      84009C9C9C00737373006363630073737300ADADAD00B5B5B500BDBDBD00A5A5
      A5008484840084848400000000000000000000000000A59C9400AD4A0800DEAD
      7B00EFB58C00C67B42009C522900633921004A4A4A00BDB5AD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400EFEFEF00FFFF
      FF00EFEFEF00D6D6D600B5B5B500A5A5A500ADA5AD009C9C9C007B7B7B005252
      520031313900313139008C8C8C00000000000000000000000000000000004A4A
      4A00DEDEDE0084848400636363007B7B7B00A5A5A500BDBDBD00D6D6D600C6C6
      C600ADADAD009C9C9C000000000000000000000000009C948C00B5521000E7BD
      9400FFEFD600FFDEC600FFDEB500F7BD8400C6844A009C522900523121000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00E7E7E700CECE
      CE00B5B5B500B5B5B500CECECE00B5B5B500ADA5A500A5A5A500ADA5AD00ADAD
      AD00A5A5A500848484009C9C9C00000000000000000000000000000000004242
      42002D2D2D0058534E006363630073737300A5A5A500B5B5B500D6D6D600C6C6
      C600ADADAD009C9C9C00000000000000000000000000948C7B00B5521000E7C6
      AD00FFE7D600FFDEC600FFDEB500FFE7BD00FFD68400FFAD5A00733910009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400BDBDBD00B5B5B500B5B5
      B500D6D6D600DEDEDE00EFEFEF00F7F7F700E7E7E700CECECE00BDBDBD00ADAD
      AD00A5A5A500ADA5AD00A5A5A500000000000000000000000000000000004A4A
      4A0058534E0045444200516061007B7B7B00A5A5A500B5B5B500D6D6D600C6C6
      C600A5A5A50094949400000000000000000000000000948C7B00BD631800E7CE
      B500FFEFD600CED6CE00009CCE00FFDEB500FFC65A00F7B57300633921008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400B5B5B500D6D6D600D6D6
      D600D6D6D600E7E7E700DEDEDE00B5BDB500B5B5B500D6D6D600DEDEDE00DEDE
      DE00D6CECE00C6C6C600ADADAD00000000000000000000000000000000004A4A
      4A00A5A5A50054777B00477AA90018556F008A5B5200B5B5B500BDBDBD00A5A5
      A5008484840084848400000000000000000000000000948C7B00BD631800FFDE
      C600DEE7DE00009CCE00009CCE00BDBDA50094947300D6946300844A18008484
      8400949494000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400DEDEDE00D6D6
      D600E7E7E700D6D6D600B5B5B500BDDEBD00CECECE00B5B5B500BDB5B500BDBD
      BD00C6C6C600CECECE00BDBDBD00000000000000000000000000000000004242
      4200D6D6D60054777B0041749600947E7500C17135008A5B5200D6D6D600C6C6
      C600ADADAD009C9C9C000000000000000000000000009C846B00C66B2900FFE7
      D60039ADD600BDD6DE00ADD6D600009CCE00A59C8400EFB58C00FFCE9400C684
      4A00946339006B6B6B0094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000084848400CECE
      CE00BDBDBD00C6BDBD00E7E7E700F7F7F700EFEFEF00F7EFE700E7DEDE00B5B5
      B500C6C6C6008484840000000000000000000000000000000000000000004242
      4200D6D6D6008C848C007C707800F1BC8600F0A85C00C07638008A5B5200C6C6
      C600ADADAD009C9C9C000000000000000000000000009C846B00C66B2900F7EF
      E700F7F7EF00FFF7E700DEE7DE0039A5BD00FFE7C600E7AD7300C6844A00FFCE
      9400FFCE9400BD946B005A5A84006B6B6B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400DEE7E700D6D6D600B5B5B500CECECE00DEDEDE00DEDEDE00DEDEDE00D6D6
      D600848484000000000000000000000000000000000000000000000000004242
      4200DEDEDE008C848C00AD7B7300FBD3A900F9C48D00EFA65A00C07638008A5B
      5200ADADAD009C9C9C000000000000000000000000009C846B00C66B2900FFF7
      EF00FFF7F700FFF7E700FFF7E7004AADCE00F7EFDE00E7BD9400633918008C7B
      6300EFB58C00AD9C9C00315AD6004A52B5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7EFE700FFE7DE00EFD6CE00EFD6CE00EFD6CE00E7DEDE004A4A42004A4A
      42004A4A42004A4A42004A4A42004A4A42000000000000000000000000005242
      4A00A5A5A5007373730063636300AD7B7300FBD3A900F9C48D00F0A85C00C171
      35008A5B52007B7B7B000000000000000000000000009C846B00CE7B4200FFF7
      F700FFFFFF00FFF7F700FFF7EF00ADD6D600CEE7E700F7BD9400523121008484
      840000000000BDB5AD00426BD600424A9C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFDECE00FFD6C600FFCEB500FFC6AD004A4A42007B94
      EF002139AD00FFE7DE00FFE7DE006B6363000000000000000000000000005242
      4A00E7DED6008C848C006B63630073737300AD7B7300FBD3A900F8C28C00EDA7
      5F00B56D3E008A5B5200000000000000000000000000AD8C6B00CE7B4200FFF7
      F700FFFFFF00FFFFFF00FFFFFF00D6EFEF00CEE7E700F7BD8400523121008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFD6C600FFD6C600FFCEB500FFBDAD007B94EF002139
      AD007B94EF002139AD00FFE7DE006B6363000000000000000000000000005242
      4A00E7DED6008C848C0063635A006B736B009C9C9C00AD7B7300FBD3A9009891
      A20035A8F5000316AC0000009A000000000000000000ADA59C00CE631000C673
      3900D6946300DEB59C00EFCEC600F7EFE700FFFFFF00E7BD94005A4229008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEB5B500FFE7DE00FFD6C600FFD6C600FFCEB500FFBDAD004A4A4200FFE7
      DE00FFE7DE002139AD007B94EF007B7363000000000000000000000000005242
      4A00A5A5A50073737300635A6B006B736B0094949400ADADAD00AD7B73004A9E
      ED001029D6001029D6000316AC0000009A0000000000BDB5AD00E78C2900C65A
      0000C65A0000C65A0000BD520000C65A1000C67B4200C67339005A4A31009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEB5
      B500FFE7DE00FFE7DE00FFDECE00FFD6C600FFCEB500FFBDAD004A4A4200FFE7
      DE00FFE7DE00FFE7DE002139AD007B94EF000000000000000000000000004A52
      4A00ADADB5008C8C8C009CA59400A5A5A500A5A5A500A5A5A500ADADAD000018
      C6006D8AFD00106BFF001029D60000000000000000000000000000000000BDB5
      AD00ADA59C009C948C00CE8C4200D6843100D6731000D66B0000949494000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DEB5
      B500DEB5B500DEB5B500DEB5B500F7BDB500F7BDB500000000004A4A42006B63
      63006B6363006B6363007B7363002139AD000000000000000000000000000000
      00008C847B007B737B00736B730073737B007373730073737300737373007B7B
      7B000018C6000018C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FDC7FFFF87FF0000F003FFFF80FF0000
      C001E003803F00000001E003801F00000001E003800F00000001E003800F0000
      0001E003800700008001E00380010000C003E00380000000E007E00380000000
      F000E00380080000F000E003800F0000F000E001800F0000F000E000800F0000
      E000E001E01F0000E040F003FFFF000000000000000000000000000000000000
      000000000000}
  end
  object spOpenSkinDialog1: TspOpenSkinDialog
    ShowThumbnails = True
    ToolButtonsTransparent = False
    DialogWidth = 0
    DialogHeight = 0
    DialogMinWidth = 0
    DialogMinHeight = 0
    CompressedFilterIndex = 1
    UnCompressedFilterIndex = 2
    AlphaBlend = False
    AlphaBlendValue = 200
    AlphaBlendAnimation = False
    CtrlAlphaBlend = False
    CtrlAlphaBlendValue = 225
    CtrlAlphaBlendAnimation = False
    LVHeaderSkinDataName = 'resizebutton'
    SkinData = MainForm.spSkinData1
    CtrlSkinData = MainForm.spSkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Title = 'Open skin'
    Filter = 'Compressed skin (*.skn)|*.skn|UnCompressed skin (*.ini)|*.ini'
    FilterIndex = 1
    Left = 208
    Top = 355
  end
end

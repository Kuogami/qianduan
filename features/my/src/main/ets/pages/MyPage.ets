


@Component
export struct MyPage {
  @State message: string = '我的';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5')
  }
}
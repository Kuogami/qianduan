@Entry
@Component
struct Index {

  @State currentIndex: number = 0;

  private tabsController : TabsController = new TabsController();

  @Builder
  tabBarBuilder(title: string, targetIndex: number, selectedIcon: Resource, unselectIcon: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedIcon : unselectIcon)
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? '#f8e71c' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }){
      TabContent() {
        Text('TabContent1')
      }
      .tabBar(this.tabBarBuilder('笔记', 0, $r('app.media.notes_on'), $r('app.media.notes_off')))

      TabContent() {
        Text('TabContent2')
      }
      .tabBar(this.tabBarBuilder('待办', 1, $r('app.media.check_on'), $r('app.media.check_off')))

      TabContent() {
        Text('TabContent3')
      }
      .tabBar(this.tabBarBuilder('文档', 2, $r('app.media.doc_on'), $r('app.media.doc_off')))

      TabContent() {
        Text('TabContent4')
      }
      .tabBar(this.tabBarBuilder('我的', 3, $r('app.media.user_on'), $r('app.media.user_off')))
    }
    .scrollable(false)
    .vertical(false)
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })
  }

}



@Component
export struct TodosPage {
  // 控制输入框显示与隐藏的状态变量
  @State isInputVisible: boolean = false;
  // 用户输入的待办内容
  @State inputValue: string = '';
  //输入参数
  @State item:string='Ciallo(^^)!!';
  //搜索参数
  @State changeValue: string = ''
  @State submitValue: string = ''
  @State positionInfo: CaretOffset = { index: 0, x: 0, y: 0 }
  controller: SearchController = new SearchController()

  // 用来保存拖动状态
  @State draggingIndex: number | null = null;  // 当前拖动的待办项索引
  @State dragStartX: number = 0;  // 拖动起始位置的 X 坐标
  @State dragStartY: number = 0;  // 拖动起始位置的 Y 坐标
  @State dragOffsetX: number = 0; // 拖动时的 X 偏移量
  @State dragOffsetY: number = 0; // 拖动时的 Y 偏移量



  @State listData: number[] = [];  // 初始数据
  // 定义 onAddItem 方法
  onAddItem() {
    this.listData.push(this.listData.length);
  }

  build() {
    Column() {
      // Banner 组件的内容
      Column() {
        Row() {  // 使用 Row 将子组件水平排列
          Text('代办')
            .fontSize(40)
            .fontColor(Color.Black)
            .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '00.00vp' })
          //添加代办
          Button({ type: ButtonType.Circle, stateEffect: false }) {
            Image($r('app.media.add'))
          }
          .width(35)
          .height(35)
          .backgroundColor(Color.White)
          .borderRadius(10)
          .margin({ top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '180.00vp' })
          .onClick(() => {
            this.onAddItem();  // 点击按钮时调用 onAddItem
          })
        }
        Row() {
          Search({ value: this.changeValue, placeholder: '', controller: this.controller })
            .searchButton('搜索')
            .width('95%')
            .height(40)
            .backgroundColor('#ffe5e5e5')
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .textFont({ size: 14, weight: 400 })
            .onSubmit((value: string) => {
              this.submitValue = value
            })
            .onChange((value: string) => {
              this.changeValue = value
            })
            .margin({
              top: '0.00vp',
              right: '0.00vp',
              bottom: '00.00vp',
              left: '00.00vp'
            })
        }.height(50)
      }

      // ListExample 组件的内容
      Column() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.listData, () => {
            ListItem() {
              //代办即输入框
              Row(){
                TextInput({placeholder: '新待办 '+this.item})
                  .backgroundColor(0xFFFFFF)
                  .height(50)
                  .width('97%')
                  .margin({
                    top: '0.00vp',
                    right: '10.00vp',
                    bottom: '00.00vp',
                    left: '0.00vp'
                  })
              }
            }
          }, (item: string) => item)
        }
        .listDirection(Axis.Vertical)
        .friction(0.5)
        .divider({ strokeWidth: 2, color: 0xFFFFFF })
        .edgeEffect(EdgeEffect.Spring)
        .width('90%')
        .scrollBar(BarState.On)
        .scrollBarColor(0xdcdca) // 滚动条颜色
        .scrollBarWidth(6) // 滚动条宽度
      }
      .width('100%')
      .height('90%')
      .backgroundColor(0xDCDCDC)
      .padding({ top: 5 })
    }
  }
}
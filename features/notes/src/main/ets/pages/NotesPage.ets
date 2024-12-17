
import { CustomInput } from '../model/CustomInput'; // 输入框控件


@Component
export struct NotesPage {
  @State message: string = '全部笔记';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight(700)
        .width('100%')
        .textAlign(TextAlign.Start)
        .height(45) // 设置高度为45
      //CustomInput() // 使用控件上头顶部
    }
    .height('100%')
    .width('100%')

  }
}
//输入框组件，可以用来搜索


import { inputMethod } from '@kit.IMEKit'; // 导入输入方法模块

@Component
export struct CustomInput {
  @State inputText: string = ''; // 定义一个状态变量inputText，用于存储输入框的文本内容
  private isAttach: boolean = false; // 标记是否已经绑定输入方法
  private inputController: inputMethod.InputMethodController = inputMethod.getController(); // 获取输入方法控制器

  build() {
    Text(this.inputText) // 使用Text组件显示inputText的内容
      .fontSize(20) // 设置字体大小为20
      .width('80%') // 设置宽度为80%
      .lineHeight(40) // 设置行高为40
      .id('customInput') // 为Text组件设置ID，以便后续操作
      .onBlur(() => { // 当Text组件失去焦点时，调用off方法
        this.off();
      })
      .height(45) // 设置高度为45
      .border({ color: '#554455', radius: 30, width: 1 }) // 设置边框样式
      .maxLines(1) // 设置最大行数为1
      .onClick(() => { // 当Text组件被点击时，调用attachAndListener方法
        console.log('Text component was clicked');
        this.attachAndListener();
      });
  }

  async attachAndListener() { // 定义一个方法，用于绑定输入方法并设置监听
    focusControl.requestFocus('CustomInput'); // 请求焦点到ID为'CustomInput'的组件
    await this.inputController.attach(true, { // 绑定输入方法
      inputAttribute: {
        textInputType: inputMethod.TextInputType.TEXT, // 设置文本输入类型为文本
        enterKeyType: inputMethod.EnterKeyType.SEARCH // 设置回车键类型为搜索
      }
    });
    if (!this.isAttach) { // 如果之前没有绑定过输入方法
      this.inputController.on('insertText', (text) => { // 监听插入文本事件
        this.inputText += text; // 将插入的文本追加到inputText
      });
      this.inputController.on('deleteLeft', (length) => { // 监听删除文本事件
        this.inputText = this.inputText.substring(0, this.inputText.length - length); // 删除指定长度的文本
      });
      this.isAttach = true; // 标记为已绑定
    }
  }

  off() { // 定义一个方法，用于取消监听和标记
    this.isAttach = false; // 标记为未绑定
    this.inputController.off('insertText'); // 取消监听插入文本事件
    this.inputController.off('deleteLeft'); // 取消监听删除文本事件
  }
}
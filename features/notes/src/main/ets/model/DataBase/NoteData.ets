// 笔记数据的类


export class NoteData {
  id: number; // 笔记的唯一标识符
  title: string; // 笔记的标题
  content: string; // 笔记的内容
  importance: number; // 笔记的重要程度，例如1到5的等级
  creationTime: number; // 笔记的创建时间，通常是一个时间戳
  updateTime: number; // 笔记的最后更新时间
  //可以添加图片信息

  constructor(id: number, title: string, content: string, importance: number, creationTime: number, updateTime: number) {
    this.id = id;
    this.title = title;
    this.content = content;
    this.importance = importance;
    this.creationTime = creationTime;
    this.updateTime = updateTime;
  }
}
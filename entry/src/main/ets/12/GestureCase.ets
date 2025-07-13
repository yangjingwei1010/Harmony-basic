import { display, promptAction } from '@kit.ArkUI';

@Entry
@Component
struct GestureCase {
  @State message: string = 'Hello World';
  @State
  showBind: boolean = false
  @State
  screenWidth: number = 0
  @State
  selectType: SelectType = SelectType.NONE

  aboutToAppear(): void {
    // 方法一获取当前屏幕到宽度
    // this.screenWidth = px2vp(display.getDefaultDisplaySync().width)
  }

  @Builder
  bindContent() {
    Column() {
      Row() {
        Text('删')
          .fontSize(24)
          .width(100)
          .aspectRatio(1)
          .fontColor('#fff')
          .backgroundColor(this.selectType === SelectType.DELETE ? Color.Red : '#ccc')
          .rotate({
            angle: -10
          })
          .borderRadius(50)
          .textAlign(TextAlign.Center)


        Text('文')
          .fontSize(24)
          .width(100)
          .aspectRatio(1)
          .rotate({
            angle: 10
          })
          .borderRadius(50)
          .fontColor('#fff')
          .backgroundColor(this.selectType === SelectType.TEXT ? Color.Red : '#ccc')
          .textAlign(TextAlign.Center)
      }
      .padding({
        left: 20,
        right: 20
      })
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#4f000000')
  }

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        Button('发语音')
          .width('100%')
          .type(ButtonType.Normal)
          .backgroundColor('#ff149d21')
          .gesture(
            GestureGroup(GestureMode.Parallel,
              // 1、长按
              LongPressGesture()
                .onAction(() => {
                  // 触发手势执行到内容
                  this.showBind = true
                })
                .onActionEnd(() => {
                  this.showBind = false
                }),
              // 2、滑动
              PanGesture()
                .onActionUpdate((event) => {
                  if (event.fingerList[0].globalX <= this.screenWidth / 2) {
                    this.selectType = SelectType.DELETE
                  } else {
                    this.selectType = SelectType.TEXT
                  }
                })
                .onActionEnd(() => {
                  this.selectType = SelectType.NONE
                }),
              // 3、按压
              TapGesture()
                .onAction(() => {
                  promptAction.showToast({
                    message: '按压手势'
                  })
                })
            )
          )
    }
    .padding(20)
    .justifyContent(FlexAlign.End)
    .height('100%')
    .width('100%')
    .bindContentCover($$this.showBind, this.bindContent(), {
      modalTransition: ModalTransition.NONE
    })
    .onAreaChange((_, _newValue) => {
      // 方法二获取当前屏幕到宽度
      this.screenWidth = _newValue.width as number
    })
  }
}

enum SelectType {
  NONE,
  DELETE,
  TEXT
}
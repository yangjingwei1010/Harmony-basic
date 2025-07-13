
@Builder
export function MyLayoutBuilder(stateText: StateText) {
  Row() {
    Text(stateText.leftText)
    Text(stateText.rightText)
  }
  .width('100%')
  .padding(20)
  .justifyContent(FlexAlign.SpaceBetween)
  .backgroundColor(Color.Pink)
  .borderRadius(8)
}

export interface StateText {
  leftText: string
  rightText: string
}
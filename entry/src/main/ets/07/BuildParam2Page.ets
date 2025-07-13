import { BuildParamComponent } from './component/BuildParamComponent';

@Entry
@Component
struct BuildParam2Page {
  @State leftText: string = '低电量模式';
  @State
  isOn: boolean = false
  @Builder
  rightContent() {
    Toggle({
      type: ToggleType.Switch,
      isOn: $$this.isOn
    })
  }

  build() {
    Column({space: 10}) {
      BuildParamComponent({
        leftText: this.leftText,
        rightContent: () => {
          this.rightContent()
        }
      })
      BuildParamComponent({
        leftText: this.leftText,
        rightContent: () => {
          this.rightContent()
        }
      })
    }
    .width('100%')
    .height('100%')
    .padding(20)

  }
}
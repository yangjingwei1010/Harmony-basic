// import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct StateBindPage {
  @State message: string = 'Hello World';
  @State isChecked: boolean = false
  @State myDate: Date = new Date('2024-02-03')
  @State mySwitch: boolean = false
  @State mySelect: string = '请选择'
  @State mySearch: string = ''
  @State myRadio: boolean = false

  build() {
    Row() {
      Column() {
        Row() {
          Text(this.isChecked + '')
          Checkbox()
            // 双向绑定$$
            .select($$this.isChecked)
            .onChange((value) => {
              // this.isChecked = value
            })
          Button('改变')
            .onClick(() => {
              this.isChecked = !this.isChecked
            })
        }
        Divider().height(5).backgroundColor(Color.Red)
        Column() {
          Text(JSON.stringify(this.myDate))
          DatePicker({
            selected: $$this.myDate
          })
        }
        Divider().height(5).backgroundColor(Color.Pink)
        Column() {
          Text(this.mySwitch + '')
          Toggle({type: ToggleType.Switch, isOn: $$this.mySwitch})
        }
        Divider().height(5).backgroundColor(Color.Pink)
        Column() {
          Text(this.mySelect)
          Select([{value: 'aaa'}, {value: 'bbb'},
            {value: 'ccc'}, {value: 'ddd'}])
            .value($$this.mySelect)
        }
        Divider().height(5).backgroundColor(Color.Pink)
        Column() {
          Text(this.mySearch)
          Search({value: $$this.mySearch})
        }
        Divider().height(5).backgroundColor(Color.Pink)
        Column() {
          Text('radio:' + this.myRadio + '')
          Radio({value: 'radio', group: 'radioSelect'})
            .checked($$this.myRadio)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
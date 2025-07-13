import { common, Want } from '@kit.AbilityKit';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
struct StartAbilityCase {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button('去支付')
          .onClick(async () => {
            let want: Want = {
              deviceId: '',
              bundleName: 'com.example.firsttest',
              moduleName: 'feature',
              abilityName: 'FeatureAbility',
              parameters: {
                id: Date.now()
              }
            };
            const result = await (getContext() as common.UIAbilityContext).startAbilityForResult(want)
            AlertDialog.show({
              message: JSON.stringify(result)
            })
          })
        Button('打开其他应用')
          .onClick(() => {
            let want: Want = {
              deviceId: '',
              bundleName: '其他项目到bundlename',
              abilityName: 'EntyAbility'
            };
            (getContext() as common.UIAbilityContext).startAbility(want)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
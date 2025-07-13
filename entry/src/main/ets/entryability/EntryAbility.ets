import { abilityAccessCtrl, AbilityConstant, Permissions, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { KeyboardAvoidMode, window } from '@kit.ArkUI';
import { PreferenceClass } from '../09/PreferenceStorageClass';

export default class EntryAbility extends UIAbility {
  async  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    // const manager = abilityAccessCtrl.createAtManager() // 创建程序控制管理器
    // await manager.requestPermissionsFromUser(this.context,
    //   [
    //     "ohos.permission.APPROXIMATELY_LOCATION"
    //   ])
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    // 判断是否登录
    // const token = PreferenceClass.getToken(this.context)
    // if (token === '404') {
    //   windowStage.loadContent('09/PreferenceStoragePage');
    // } else {
    //   windowStage.loadContent('09/PreferenceStoragePage2');
    // }
    windowStage.loadContent('13/DouyinCase', () => {
      windowStage.getMainWindow().then((window) => {
        // 全局关闭安全区域
        window.setWindowLayoutFullScreen(true)
      })
    });

    // 键盘避让
    // windowStage.getMainWindowSync().getUIContext()
    //   .setKeyboardAvoidMode(KeyboardAvoidMode.RESIZE)
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}

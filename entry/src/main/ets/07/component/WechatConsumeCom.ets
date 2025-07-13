import { PlayControlCom } from './PlayControlCom'

@Component
struct WechatConsumeCom {

  build() {
    Column() {
      PlayControlCom()
    }
  }
}

export {WechatConsumeCom}
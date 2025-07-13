// import { preferences } from '@kit.ArkData'
import preferences from '@ohos.data.preferences'
import { Context } from '@ohos.arkui.UIContext'

export class PreferenceClass {
  // 默认仓库名
  static defaultStore: string = 'DEFAULT'
  static firstStore: string = 'FIRST_STORE'
  //仓库中的字段
  static tokenKey: string = 'TOKEN_KEY'
  // 每个字段至少需要准备2个方法

  // 设置
  static setToken(context: Context, token: string, storeName: string = PreferenceClass.defaultStore) {
    // 1.得到仓库
    const store = preferences.getPreferencesSync(context, {name: storeName})
    // 2.写入内容
    store.putSync(PreferenceClass.tokenKey, token)
    // 3.写入磁盘
    store.flush()
  }

  // 读取
  static getToken(context: Context, storeName: string = PreferenceClass.defaultStore) {
    // 1.取仓库
    const store = preferences.getPreferencesSync(context, {name: storeName})
    // 2.取值
    return store.getSync(PreferenceClass.tokenKey, '404')
  }

  //删除
  static removeToken(context: Context, storeName: string = PreferenceClass.defaultStore) {
    const store = preferences.getPreferencesSync(context, {name: storeName})
    store.deleteSync(PreferenceClass.tokenKey)
    store.flush()
  }

}
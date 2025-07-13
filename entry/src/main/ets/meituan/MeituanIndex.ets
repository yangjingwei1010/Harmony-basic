import { getData } from './api/Index'
import MeituanBottom from './components/MeituanBottom'
import MeituanCart from './components/MeituanCart'
import MeituanMain from './components/MeituanMain'
import MeituanTop from './components/MeituanTop'
import { Category } from './models/Index'
import { JSON } from '@kit.ArkTS'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct MeituanIndex {
  @Provide
  showCart: boolean = false
  @State
  list: Category[] = []

  // 是否保留
  onBackPress(): boolean | void {
    if (this.showCart) {
      this.showCart = false
      // 只在app内返回
      return true
    } else {
      // 回到后台
      return false
    }
  }

  async aboutToAppear() {
    this.list = await getData()
    console.log('list:', this.list.length)
  }

  build() {
    Stack({
      alignContent: Alignment.Bottom
    }) {
      Column() {
        MeituanTop()
        MeituanMain({
          list: this.list
        })
          .layoutWeight(1)
      }
      .width('100%')
      .height('100%')

      if (this.showCart) {
        // 购物车
        MeituanCart()
      }

      // 底部
      MeituanBottom()
    }
    .width('100%')
    .height('100%')
  }
}
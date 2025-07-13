import { GoodItemBuilder } from '../BuildParamListPage'

@Component
struct GoodItemView2 {
  // 接收数据
  @State
  goodItemList: object[] = []
  // 结束结构
  @Builder
  defaultContent() {
    Row() {
      Row() {
        Image('')
        Column() {
          Text()
          Text()
        }
      }
    }
  }
  // 没有默认值
  // @BuilderParam
  // renderItem: (item: object) => void
  // 有默认值
  @BuilderParam
  renderItem1: (item: object) => void = this.defaultContent

  build() {
    Row() {
      ForEach(this.goodItemList, (item: object) => {
        // if (this.renderItem) {
        //   this.renderItem(item)
        // }
        this.renderItem1(item)
      })

    }
  }
}

export {GoodItemView2}
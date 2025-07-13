import { FoodItem } from '../models/Index'

PersistentStorage.persistProp('cart_list', [])
export class CartStore {

  // static getCount(food: FoodItem) {
  //   const list = AppStorage.get<[FoodItem]>('cart_list')!
  //   const index = list.findIndex((listItem: FoodItem) => listItem.id === food.id)
  //   return list[index].count ?? 0
  // }

  static addCart(food: FoodItem, flag: boolean = true) {
    // 读取存储列表
    const list = AppStorage.get<FoodItem[]>('cart_list')!
    // 判断是否是首次添加
    const index = list.findIndex((listItem: FoodItem) => listItem.id === food.id)
    if (flag) {
      // +
      if (index < 0) {
        // 新建一个对象，是为了不用对象里面的count
        const newFood: FoodItem = new FoodItem()
        newFood.name = food.name
        newFood.count = food.count
        newFood.selectCount = 1
        newFood.price = food.price
        newFood.picture = food.picture
        newFood.id = food.id
        // 首次添加
        list?.unshift(newFood)
      } else {
        // 添加数量
        (list[index].selectCount as number)++
        // index删掉1个，再重新添加1个
        list.splice(index, 1, list[index])
      }
    } else {
      // -
      (list[index].selectCount as number)--
      if (list[index].selectCount === 0) {
        list.splice(index, 1)
      } else {
        list.splice(index, 1, list[index])
      }
    }
    // 更新数据
    AppStorage.setOrCreate('cart_list', list)
  }

  static clearCart() {
    AppStorage.setOrCreate('cart_list', [])
  }
}
//“唯一数据源,组件仍然保有局部状态,实际上获得的是计算属性
const state = {
	count : 100

};
//更改 Vuex 的 store 中的状态的唯一方法是提交 mutation。Vuex 中的 mutation 非常类似于事件：每个 mutation 都有一个字符串的 事件类型 (type) 和 一个 回调函数 (handler)。这个回调函数就是我们实际进行状态更改的地方，并且它会接受 state 作为第一个参数：
//commit就是触发他,也可以,,,你可以向 store.commit 传入额外的参数，即 mutation 的 载荷（payload）：
const mutations = {
	increment(state){
		state.count ++;
		console.log(this);
		
	}
};
const actions = {
	increment (context ){
		context.commit('increment')
	}
};

export default {
	state,
	mutations,
	actions
	
}

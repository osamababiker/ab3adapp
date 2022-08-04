const baseUri = 'https://ab3adapp.com/api';
const uploadUri = 'https://ab3adapp.com/upload';

const loginEndPoint = baseUri + '/sanctum/token';
const registerEndPoint = baseUri + '/register';
const fetchAuthUserEndPoint = baseUri + '/user';
const logoutEndPoint = baseUri + '/user/revoke';

const fetchItemsEndPoint = baseUri + '/items';

const fetchCategoriesEndPoint = baseUri + '/categories';

const fetchOrdersEndPoint = baseUri + '/orders';
const fetchSingleOrderEndPoint = baseUri + '/orders/single';
const fetchAllOrdersEndPoint = baseUri + '/orders/all';
const sendOrderEndPoint = baseUri + '/orders/send';
const deleteOrderEndPoint = baseUri + '/orders/delete';

const fetchDeliveryRequestsEndPoint = baseUri + '/delivery/request';
const fetchAcceptedRequestEndPoint = baseUri + '/delivery/request/accepted';
const sendDeliveryRequestEndPoint = baseUri + '/delivery/request/store';
const orderCompleteEndPoint = baseUri + '/delivery/order/complete';

const updateOrderEndPoint = baseUri + '/order/update';

const fetchevaluationEndPoint = baseUri + '/evaluation';
const saveEvaluationEndPoint = baseUri + '/evaluation/save';

const settingsEndPoint = baseUri + '/settings';

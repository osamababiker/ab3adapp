const baseUri = 'https://ab3adapp.com/api';
const uploadUri = 'https://ab3adapp.com/upload';

const loginEndPoint = baseUri + '/sanctum/token';
const registerEndPoint = baseUri + '/register';
const fetchAuthUserEndPoint = baseUri + '/user';
const logoutEndPoint = baseUri + '/user/revoke';

const fetchItemsEndPoint = baseUri + '/items';

const fetchCategoriesEndPoint = baseUri + '/categories';

const fetchOrdersEndPoint = baseUri + '/orders';
const sendOrderEndPoint = baseUri + '/orders/send';

const fetchDeliveryRequestsEndPoint = baseUri + '/delivery/request';
const fetchAcceptedRequestsEndPoint = baseUri + '/delivery/request/accepted';
const sendDeliveryRequestEndPoint = baseUri + '/delivery/request/store';
const orderCompleteEndPoint = baseUri + '/delivery/order/complete';

const updateOrderEndPoint = baseUri + '/order/update';

const fetchevaluationEndPoint = baseUri + '/evaluation';
const saveEvaluationEndPoint = baseUri + '/evaluation/save';

const settingsEndPoint = baseUri + '/settings';

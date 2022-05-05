#!/bin/bash

if [ ! -n "${01}" ] ;then 
  echo '未指定压缩文件'
  exit
fi

# 解压文件
echo '解压文件...'
FILE=${01}
DIST=${FILE/.zip/}
rm -rf "${DIST}" "${DIST}-cn"
unzip -q "${FILE}"
mv -f "${DIST}\dist" "${DIST}-cn"
cd "${DIST}-cn"


# swagger-ui-bundle.js
# [不可变]sed -i 's|"Collapse"|"折叠"|g' swagger-ui-bundle.js
# [不可变]sed -i 's|"Models"|"模型列表"|g' swagger-ui-bundle.js
# [不可变]sed -i 's|"Property"|"属性"|g' swagger-ui-bundle.js
# sed -i 's|"Could not find the language '{}', did you forget to load/include a language module?"|"Could not find the language '{}', did you forget to load/include a language module?"|g' swagger-ui-bundle.js
# sed -i 's|"Language definition for '{}' could not be registered."|"Language definition for '{}' could not be registered."|g' swagger-ui-bundle.js
# sed -i 's|"The '{}' language is required, but not loaded."|"The '{}' language is required, but not loaded."|g' swagger-ui-bundle.js
# sed -i 's|"Unknown language: `%s` is not registered"|"未知语言: `%s` 未被注册"|g' swagger-ui-bundle.js
# sed -i 's|"[Modified value]"|"[修改后的值]"|g' swagger-ui-bundle.js
# sed -i 's|"begin & end are not supported with match"|"begin & end are not supported with match"|g' swagger-ui-bundle.js
echo '汉化文件: swagger-ui-bundle.js'
sed -i 's|" - Website"|" - 主页"|g' swagger-ui-bundle.js
sed -i 's|" Iterator"|" Iterator"|g' swagger-ui-bundle.js
sed -i 's|" No operations defined in spec!"|"规范中没有定义操作！"|g' swagger-ui-bundle.js
sed -i 's|" Undocumented "|" 未记录的 "|g' swagger-ui-bundle.js
sed -i 's|" Warning: Deprecated"|" 警告：已弃用"|g' swagger-ui-bundle.js
sed -i 's|" argument"|" argument"|g' swagger-ui-bundle.js
sed -i 's|" is not a constructor"|" 不是构造函数"|g' swagger-ui-bundle.js
sed -i 's|" is not a function"|" 不是一个函数"|g' swagger-ui-bundle.js
sed -i 's|" is not a symbol"|" 不是一个符号"|g' swagger-ui-bundle.js
sed -i 's|" is not an object"|" 不是一个对象"|g' swagger-ui-bundle.js
sed -i 's|" is not iterable"|" 不可迭代"|g' swagger-ui-bundle.js
sed -i 's|" is not supported (we accept pull requests)"|" 不被支持（我们接受拉取请求）"|g' swagger-ui-bundle.js
sed -i 's|" with PKCE"|" with PKCE"|g' swagger-ui-bundle.js
sed -i 's|"(no example available)"|"(没有可用的示例)"|g' swagger-ui-bundle.js
sed -i 's|", description: "|", description: "|g' swagger-ui-bundle.js
sed -i 's|", error: "|", error: "|g' swagger-ui-bundle.js
sed -i 's|", see the console."|", 详见控制台."|g' swagger-ui-bundle.js
sed -i 's|". Received type "|". Received type "|g' swagger-ui-bundle.js
sed -i 's|".toJSON called"|".toJSON called"|g' swagger-ui-bundle.js
sed -i 's|"0 width match regex"|"0 width match regex"|g' swagger-ui-bundle.js
sed -i 's|"<i>Available values</i> : "|"<i>可用值</i> : "|g' swagger-ui-bundle.js
sed -i 's|"<i>Default value</i> : "|"<i>默认值</i> : "|g' swagger-ui-bundle.js
sed -i 's|"<i>Example</i> : "|"<i>示例</i> : "|g' swagger-ui-bundle.js
sed -i 's|"A React component"|"一个 React 组件"|g' swagger-ui-bundle.js
sed -i 's|"API requires the following scopes. Select which ones you want to grant to Swagger UI."|"API 需要以下范围. 选择要授予 Swagger UI 的权限."|g' swagger-ui-bundle.js
sed -i 's|"Aborted"|"Aborted"|g' swagger-ui-bundle.js
sed -i 's|"Abstract"|"Abstract"|g' swagger-ui-bundle.js
sed -i 's|"Add "|"添加 "|g' swagger-ui-bundle.js
sed -i 's|"Already read"|"已读"|g' swagger-ui-bundle.js
sed -i 's|"Animation"|"Animation"|g' swagger-ui-bundle.js
sed -i 's|"Anything can be here"|"什么都可以在这里"|g' swagger-ui-bundle.js
sed -i 's|"Argument must be a Buffer"|"参数必须是 Buffer"|g' swagger-ui-bundle.js
sed -i 's|"Arguments"|"Arguments"|g' swagger-ui-bundle.js
sed -i 's|"Array Iterator"|"Array Iterator"|g' swagger-ui-bundle.js
sed -i 's|"Array must contain at least "|"数组至少包含 "|g' swagger-ui-bundle.js
sed -i 's|"Array must not contain more then "|"数组不能包含 "|g' swagger-ui-bundle.js
sed -i 's|"Array"|"Array"|g' swagger-ui-bundle.js
sed -i 's|"At least one callback required"|"At least one callback required"|g' swagger-ui-bundle.js
sed -i 's|"Attempt to access memory outside buffer bounds"|"Attempt to access memory outside buffer bounds"|g' swagger-ui-bundle.js
sed -i 's|"Attempt to allocate Buffer larger than maximum size: 0x"|"Attempt to allocate Buffer larger than maximum size: 0x"|g' swagger-ui-bundle.js
sed -i 's|"Attempt to write outside buffer bounds"|"Attempt to write outside buffer bounds"|g' swagger-ui-bundle.js
sed -i 's|"Authorization URL: "|"授权地址: "|g' swagger-ui-bundle.js
sed -i 's|"Authorization header"|"授权请求头"|g' swagger-ui-bundle.js
sed -i 's|"Authorization may be unsafe, passed state was changed in server Passed state wasn'\''t returned from auth server"|"授权可能不安全, 通过状态已在服务器中更改, 通过状态未从身份验证服务器返回"|g' swagger-ui-bundle.js
sed -i 's|"Authorize"|"授权"|g' swagger-ui-bundle.js
sed -i 's|"Available authorizations"|"可用授权"|g' swagger-ui-bundle.js
sed -i 's|"Backspace"|"Backspace"|g' swagger-ui-bundle.js
sed -i 's|"Bad Promise constructor"|"错误的 Promise 构造函数"|g' swagger-ui-bundle.js
sed -i 's|"Bash"|"Bash"|g' swagger-ui-bundle.js
sed -i 's|"Basic "|"Basic "|g' swagger-ui-bundle.js
sed -i 's|"Bearer "|"Bearer "|g' swagger-ui-bundle.js
sed -i 's|"BigInt not supported"|"不支持 BigInt"|g' swagger-ui-bundle.js
sed -i 's|"Buffer size must be a multiple of 16-bits"|"缓冲区大小必须是16-bits的倍数"|g' swagger-ui-bundle.js
sed -i 's|"Buffer size must be a multiple of 32-bits"|"缓冲区大小必须是32-bits的倍数"|g' swagger-ui-bundle.js
sed -i 's|"Buffer size must be a multiple of 64-bits"|"缓冲区大小必须是64-bits的倍数"|g' swagger-ui-bundle.js
sed -i 's|"Buffer"|"Buffer"|g' swagger-ui-bundle.js
sed -i 's|"Buffer.write(string, encoding, offset[, length]) is no longer supported"|"Buffer.write(string, encoding, offset[, length]) is no longer supported"|g' swagger-ui-bundle.js
sed -i 's|"Button"|"Button"|g' swagger-ui-bundle.js
sed -i 's|"Callbacks"|"Callbacks"|g' swagger-ui-bundle.js
sed -i 's|"Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types"|"Calling PropTypes validators directly is not supported by the `prop-types` package. Use PropTypes.checkPropTypes() to call them. Read more at http://fb.me/use-check-prop-types"|g' swagger-ui-bundle.js
sed -i 's|"Can'\''t call method on "|"Can'\''t call method on "|g' swagger-ui-bundle.js
sed -i 's|"Can'\''t convert object to primitive value"|"Can'\''t convert object to primitive value"|g' swagger-ui-bundle.js
sed -i 's|"Can'\''t set "|"Can'\''t set "|g' swagger-ui-bundle.js
sed -i 's|"Cancel"|"取消"|g' swagger-ui-bundle.js
sed -i 's|"Cannot call "|"无法调用 "|g' swagger-ui-bundle.js
sed -i 's|"Cannot call a class as a function"|"不能将类作为函数调用"|g' swagger-ui-bundle.js
sed -i 's|"Cannot find module '\''"|"找不到模块 '\''"|g' swagger-ui-bundle.js
sed -i 's|"Cannot perform an `add` operation at the desired path"|"Cannot perform an `add` operation at the desired path"|g' swagger-ui-bundle.js
sed -i 's|"Cannot perform the operation at a path that does not exist"|"Cannot perform the operation at a path that does not exist"|g' swagger-ui-bundle.js
sed -i 's|"Cannot perform this action with an infinite size."|"Cannot perform this action with an infinite size."|g' swagger-ui-bundle.js
sed -i 's|"Cannot set on an immutable record."|"Cannot set on an immutable record."|g' swagger-ui-bundle.js
sed -i 's|"Cannot step a Range by 0"|"Cannot step a Range by 0"|g' swagger-ui-bundle.js
sed -i 's|"CapsLock"|"CapsLock"|g' swagger-ui-bundle.js
sed -i 's|"Capture"|"Capture"|g' swagger-ui-bundle.js
sed -i 's|"Clear"|"清除"|g' swagger-ui-bundle.js
sed -i 's|"Client credentials location:"|"客户端凭据位置:"|g' swagger-ui-bundle.js
sed -i 's|"Close"|"关闭"|g' swagger-ui-bundle.js
sed -i 's|"Code"|"响应码"|g' swagger-ui-bundle.js
sed -i 's|"Collapse operation"|"折叠操作"|g' swagger-ui-bundle.js
sed -i 's|"Component"|"组件"|g' swagger-ui-bundle.js
sed -i 's|"Computed URL:"|"计算的 URL:"|g' swagger-ui-bundle.js
sed -i 's|"Connect("|"Connect("|g' swagger-ui-bundle.js
sed -i 's|"Content-Type"|"Content-Type"|g' swagger-ui-bundle.js
sed -i 's|"Context"|"Context"|g' swagger-ui-bundle.js
sed -i 's|"Control"|"Control"|g' swagger-ui-bundle.js
sed -i 's|"Controls "|"Controls "|g' swagger-ui-bundle.js
sed -i 's|"Could not parse object parameter value string as JSON"|"Could not parse object parameter value string as JSON"|g' swagger-ui-bundle.js
sed -i 's|"Could not render "|"无法渲染 "|g' swagger-ui-bundle.js
sed -i 's|"Could not resolve pointer: "|"Could not resolve pointer: "|g' swagger-ui-bundle.js
sed -i 's|"Could not resolve reference: "|"Could not resolve reference: "|g' swagger-ui-bundle.js
sed -i 's|"DEBUG: ExamplesSelect was not given an onSelect callback"|"DEBUG: ExamplesSelect 未提供 onSelect 回调"|g' swagger-ui-bundle.js
sed -i 's|"DataView"|"DataView"|g' swagger-ui-bundle.js
sed -i 's|"Date"|"Date"|g' swagger-ui-bundle.js
sed -i 's|"DeepLink"|"DeepLink"|g' swagger-ui-bundle.js
sed -i 's|"Delete"|"删除"|g' swagger-ui-bundle.js
sed -i 's|"Deprecated:"|"已弃用:"|g' swagger-ui-bundle.js
sed -i 's|"Derived constructors may only return object or undefined"|"派生构造函数只能返回对象或未定义"|g' swagger-ui-bundle.js
sed -i 's|"Description"|"描述"|g' swagger-ui-bundle.js
sed -i 's|"Details"|"详情"|g' swagger-ui-bundle.js
sed -i 's|"Download file"|"下载文件"|g' swagger-ui-bundle.js
sed -i 's|"Download headers detected but your browser does not support downloading binary via XHR (Blob)."|"检测到下载标头，但您的浏览器不支持通过 XHR (Blob) 下载二进制文件."|g' swagger-ui-bundle.js
sed -i 's|"Download"|"下载"|g' swagger-ui-bundle.js
sed -i 's|"Edit Value"|"编辑值"|g' swagger-ui-bundle.js
sed -i 's|"Elements in allOf must be objects"|"allOf 中的元素必须是对象"|g' swagger-ui-bundle.js
sed -i 's|"End"|"End"|g' swagger-ui-bundle.js
sed -i 's|"Enter"|"Enter"|g' swagger-ui-bundle.js
sed -i 's|"Enum:"|"枚举:"|g' swagger-ui-bundle.js
sed -i 's|"Error"|"Error"|g' swagger-ui-bundle.js
sed -i 's|"Error: Swagger-Client did not provide a `resolveSubtree` method, doing nothing."|"Error: Swagger-Client 没有提供 `resolveSubtree` 方法，什么都不做."|g' swagger-ui-bundle.js
sed -i 's|"Errors"|"错误"|g' swagger-ui-bundle.js
sed -i 's|"Escape"|"Escape"|g' swagger-ui-bundle.js
sed -i 's|"Event"|"Event"|g' swagger-ui-bundle.js
sed -i 's|"Example Description"|"示例描述"|g' swagger-ui-bundle.js
sed -i 's|"Example Value"|"示例值"|g' swagger-ui-bundle.js
sed -i 's|"Example"|"Example"|g' swagger-ui-bundle.js
sed -i 's|"Examples"|"示例"|g' swagger-ui-bundle.js
sed -i 's|"Examples: "|"示例: "|g' swagger-ui-bundle.js
sed -i 's|"ExamplesSelectValueRetainer: no `onSelect` function was provided"|"ExamplesSelectValueRetainer: no `onSelect` function was provided"|g' swagger-ui-bundle.js
sed -i 's|"ExamplesSelectValueRetainer: no `updateValue` function was provided"|"ExamplesSelectValueRetainer: no `updateValue` function was provided"|g' swagger-ui-bundle.js
sed -i 's|"Execute"|"执行"|g' swagger-ui-bundle.js
sed -i 's|"Expected Array or iterable object of [k, v] entries, or keyed object: "|"Expected Array or iterable object of [k, v] entries, or keyed object: "|g' swagger-ui-bundle.js
sed -i 's|"Expected Array or iterable object of values, or keyed object: "|"Expected Array or iterable object of values, or keyed object: "|g' swagger-ui-bundle.js
sed -i 's|"Expected Array or iterable object of values: "|"Expected Array or iterable object of values: "|g' swagger-ui-bundle.js
sed -i 's|"Expected [K, V] tuple: "|"Expected [K, V] tuple: "|g' swagger-ui-bundle.js
sed -i 's|"Expected an unsigned base-10 integer value, making the new referenced value the array element with the zero-based index"|"Expected an unsigned base-10 integer value, making the new referenced value the array element with the zero-based index"|g' swagger-ui-bundle.js
sed -i 's|"Expected iterable or array-like: "|"预期可迭代或类似数组: "|g' swagger-ui-bundle.js
sed -i 's|"Expected sequence with length 2"|"长度为 2 的预期序列"|g' swagger-ui-bundle.js
sed -i 's|"Failed to fetch"|"获取失败"|g' swagger-ui-bundle.js
sed -i 's|"Failed to load API definition."|"加载 API 定义失败."|g' swagger-ui-bundle.js
sed -i 's|"Failed to load remote configuration."|"加载远程配置失败."|g' swagger-ui-bundle.js
sed -i 's|"Fallback"|"Fallback"|g' swagger-ui-bundle.js
sed -i 's|"Field"|"Field"|g' swagger-ui-bundle.js
sed -i 's|"File"|"File"|g' swagger-ui-bundle.js
sed -i 's|"Filter by tag"|"按标签过滤"|g' swagger-ui-bundle.js
sed -i 's|"Find more details"|"了解更多详情"|g' swagger-ui-bundle.js
sed -i 's|"Flow: "|"授权模式: "|g' swagger-ui-bundle.js
sed -i 's|"FormData"|"FormData"|g' swagger-ui-bundle.js
sed -i 's|"Fragment"|"Fragment"|g' swagger-ui-bundle.js
sed -i 's|"Function"|"Function"|g' swagger-ui-bundle.js
sed -i 's|"Function.prototype.bind called on incompatible "|"Function.prototype.bind 不兼容的调用 "|g' swagger-ui-bundle.js
sed -i 's|"Generator is already running"|"生成器已经在运行"|g' swagger-ui-bundle.js
sed -i 's|"Generator"|"Generator"|g' swagger-ui-bundle.js
sed -i 's|"Headers"|"Headers"|g' swagger-ui-bundle.js
sed -i 's|"Headers:"|"Headers:"|g' swagger-ui-bundle.js
sed -i 's|"Hide":"Show"|"隐藏":"显示"|g' swagger-ui-bundle.js
sed -i 's|"Home"|"Home"|g' swagger-ui-bundle.js
sed -i 's|"Illegal"|"Illegal"|g' swagger-ui-bundle.js
sed -i 's|"ImmutablePropTypes type checking code is stripped in production."|"ImmutablePropTypes 类型检查代码在生产中被剥离."|g' swagger-ui-bundle.js
sed -i 's|"In: "|"位于: "|g' swagger-ui-bundle.js
sed -i 's|"Incompatible receiver, "|"Incompatible receiver, "|g' swagger-ui-bundle.js
sed -i 's|"Incorrect invocation"|"Incorrect invocation"|g' swagger-ui-bundle.js
sed -i 's|"Index out of range"|"索引超出范围"|g' swagger-ui-bundle.js
sed -i 's|"Indexed"|"Indexed"|g' swagger-ui-bundle.js
sed -i 's|"InfoUrl"|"InfoUrl"|g' swagger-ui-bundle.js
sed -i 's|"Input"|"Input"|g' swagger-ui-bundle.js
sed -i 's|"Insert"|"Insert"|g' swagger-ui-bundle.js
sed -i 's|"Invalid "|"Invalid "|g' swagger-ui-bundle.js
sed -i 's|"Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-bundle.js
sed -i 's|"Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-bundle.js
sed -i 's|"Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-bundle.js
sed -i 's|"Invalid code point"|"无效的代码点"|g' swagger-ui-bundle.js
sed -i 's|"Invalid host"|"无效的主机"|g' swagger-ui-bundle.js
sed -i 's|"Invalid key: expected Array or string: "|"Invalid key: expected Array or string: "|g' swagger-ui-bundle.js
sed -i 's|"Invalid port"|"无效的端口"|g' swagger-ui-bundle.js
sed -i 's|"Invalid regular expression: /"|"无效的正则表达式: /"|g' swagger-ui-bundle.js
sed -i 's|"Invalid scheme"|"无效的scheme"|g' swagger-ui-bundle.js
sed -i 's|"Invalid status code"|"无效的状态码"|g' swagger-ui-bundle.js
sed -i 's|"Invalid string. Length must be a multiple of 4"|"无效的字符串。 长度必须是 4 的倍数"|g' swagger-ui-bundle.js
sed -i 's|"Invalid value of type "|"无效的类型值 "|g' swagger-ui-bundle.js
sed -i 's|"Invariant Violation"|"Invariant Violation"|g' swagger-ui-bundle.js
sed -i 's|"Iterable."|"Iterable."|g' swagger-ui-bundle.js
sed -i 's|"Iterator"|"Iterator"|g' swagger-ui-bundle.js
sed -i 's|"Javascript"|"Javascript"|g' swagger-ui-bundle.js
sed -i 's|"Jump to line "|"Jump to line "|g' swagger-ui-bundle.js
sed -i 's|"Just a test"|"Just a test"|g' swagger-ui-bundle.js
sed -i 's|"Keyed"|"Keyed"|g' swagger-ui-bundle.js
sed -i 's|"Lazy"|"Lazy"|g' swagger-ui-bundle.js
sed -i 's|"Link"|"Link"|g' swagger-ui-bundle.js
sed -i 's|"Links"|"Links"|g' swagger-ui-bundle.js
sed -i 's|"Logout"|"退出"|g' swagger-ui-bundle.js
sed -i 's|"Minified React error #"|"Minified React error #"|g' swagger-ui-bundle.js
sed -i 's|"Minified Redux error #"|"Minified Redux error #"|g' swagger-ui-bundle.js
sed -i 's|"Name: "|"名称: "|g' swagger-ui-bundle.js
sed -i 's|"Scopes are used to grant an application different levels of access to data on behalf of the end user. Each API may declare one or more scopes."|"范围用于代表最终用户授予应用程序对数据的不同级别的访问权限. 每个 API 可以声明一个或多个范围."|g' swagger-ui-bundle.js
sed -i 's|"select all"|"全选"|g' swagger-ui-bundle.js
sed -i 's|"select none"|"不选"|g' swagger-ui-bundle.js
sed -i 's|"Markdown"|"Markdown"|g' swagger-ui-bundle.js
sed -i 's|"Maximum allowed index exceeded"|"超出最大允许索引"|g' swagger-ui-bundle.js
sed -i 's|"Maximum allowed length exceeded"|"超出最大允许长度"|g' swagger-ui-bundle.js
sed -i 's|"Media type"|"媒体类型"|g' swagger-ui-bundle.js
sed -i 's|"Missing value for key: "|"缺少键值: "|g' swagger-ui-bundle.js
sed -i 's|"Module"|"模块"|g' swagger-ui-bundle.js
sed -i 's|"Name"|"名称"|g' swagger-ui-bundle.js
sed -i 's|"Network request failed"|"网络请求失败"|g' swagger-ui-bundle.js
sed -i 's|"No duplicates allowed."|"不允许重复."|g' swagger-ui-bundle.js
sed -i 's|"No one promise resolved"|"No one promise resolved"|g' swagger-ui-bundle.js
sed -i 's|"No parameters"|"没有参数"|g' swagger-ui-bundle.js
sed -i 's|"Non-extensible objects are not allowed as keys."|"不可扩展的对象不允许作为键."|g' swagger-ui-bundle.js
sed -i 's|"Not enough arguments"|"没有足够的参数"|g' swagger-ui-bundle.js
sed -i 's|"Nothing to repeat at column "|"没有可重复的列 "|g' swagger-ui-bundle.js
sed -i 's|"NumLock"|"NumLock"|g' swagger-ui-bundle.js
sed -i 's|"OAS3 wrapper: couldn'\''t get spec"|"OAS3 包装器：无法获取规范"|g' swagger-ui-bundle.js
sed -i 's|"Object already initialized"|"对象已经初始化"|g' swagger-ui-bundle.js
sed -i 's|"Object.assign cannot be called with null or undefined"|"不能使用 null 或 undefined 调用 Object.assign"|g' swagger-ui-bundle.js
sed -i 's|"Online validator badge"|"在线验证者徽章"|g' swagger-ui-bundle.js
sed -i 's|"Operation "|"Operation "|g' swagger-ui-bundle.js
sed -i 's|"Operation `op` property is not one of operations defined in RFC-6902"|"Operation `op` property is not one of operations defined in RFC-6902"|g' swagger-ui-bundle.js
sed -i 's|"OperationContainer"|"OperationContainer"|g' swagger-ui-bundle.js
sed -i 's|"OperationNotFoundError"|"OperationNotFoundError"|g' swagger-ui-bundle.js
sed -i 's|"OrderedMap {"|"OrderedMap {"|g' swagger-ui-bundle.js
sed -i 's|"OrderedSet {"|"OrderedSet {"|g' swagger-ui-bundle.js
sed -i 's|"Ori"|"Ori"|g' swagger-ui-bundle.js
sed -i 's|"Out of range index"|"Out of range index"|g' swagger-ui-bundle.js
sed -i 's|"Overflow: input needs wider integers to process"|"Overflow: input needs wider integers to process"|g' swagger-ui-bundle.js
sed -i 's|"Overview"|"Overview"|g' swagger-ui-bundle.js
sed -i 's|"Parameter '\''"|"参数 '\''"|g' swagger-ui-bundle.js
sed -i 's|"Parameter content type"|"参数内容类型"|g' swagger-ui-bundle.js
sed -i 's|"Parameter string value must be valid JSON"|"参数字符串值必须是有效的 JSON"|g' swagger-ui-bundle.js
sed -i 's|"Parameters"|"参数"|g' swagger-ui-bundle.js
sed -i 's|"Parser rule not found: "|"未找到解析器规则: "|g' swagger-ui-bundle.js
sed -i 's|"Patch sequence must be an array"|"Patch sequence must be an array"|g' swagger-ui-bundle.js
sed -i 's|"Pause"|"Pause"|g' swagger-ui-bundle.js
sed -i 's|"Plain text"|"Plain text"|g' swagger-ui-bundle.js
sed -i 's|"Portal"|"Portal"|g' swagger-ui-bundle.js
sed -i 's|"Possible EventEmitter memory leak detected. "|"Possible EventEmitter memory leak detected. "|g' swagger-ui-bundle.js
sed -i 's|"Possible cross-origin (CORS) issue? The URL origin ("|"Possible cross-origin (CORS) issue? The URL origin ("|g' swagger-ui-bundle.js
sed -i 's|"Possible mixed-content issue? The page was loaded over https:// but a "|"Possible mixed-content issue? The page was loaded over https:// but a "|g' swagger-ui-bundle.js
sed -i 's|"Profiler"|"Profiler"|g' swagger-ui-bundle.js
sed -i 's|"Promise can'\''t be resolved itself"|"Promise can'\''t be resolved itself"|g' swagger-ui-bundle.js
sed -i 's|"Promise"|"Promise"|g' swagger-ui-bundle.js
sed -i 's|"Promise-chain cycle"|"Promise-chain cycle"|g' swagger-ui-bundle.js
sed -i 's|"Prototype"|"Prototype"|g' swagger-ui-bundle.js
sed -i 's|"Readable.from is not available in the browser"|"Readable.from is not available in the browser"|g' swagger-ui-bundle.js
sed -i 's|"Record"|"Record"|g' swagger-ui-bundle.js
sed -i 's|"Reduce of empty array with no initial value"|"减少没有初始值的空 array"|g' swagger-ui-bundle.js
sed -i 's|"Reduce of empty map with no initial value"|"减少没有初始值的空 map"|g' swagger-ui-bundle.js
sed -i 's|"Reflect"|"Reflect"|g' swagger-ui-bundle.js
sed -i 's|"Request URL"|"请求 URL"|g' swagger-ui-bundle.js
sed -i 's|"Request body"|"请求体"|g' swagger-ui-bundle.js
sed -i 's|"Request content type"|"请求内容类型"|g' swagger-ui-bundle.js
sed -i 's|"Request style '\''"|"请求样式 '\''"|g' swagger-ui-bundle.js
sed -i 's|"Request"|"Request"|g' swagger-ui-bundle.js
sed -i 's|"Required "|"必填项 "|g' swagger-ui-bundle.js
sed -i 's|"Required field is not provided"|"未提供必填字段"|g' swagger-ui-bundle.js
sed -i 's|"Required parameter "|"必填参数 "|g' swagger-ui-bundle.js
sed -i 's|"Required property not found"|"未找到所需属性"|g' swagger-ui-bundle.js
sed -i 's|"Reset"|"重置"|g' swagger-ui-bundle.js
sed -i 's|"Response content type"|"响应内容类型"|g' swagger-ui-bundle.js
sed -i 's|"Responses"|"响应"|g' swagger-ui-bundle.js
sed -i 's|"Row"|"Row"|g' swagger-ui-bundle.js
sed -i 's|"Rules manager: invalid rule name "|"规则管理器：无效的规则名称 "|g' swagger-ui-bundle.js
sed -i 's|"Schema":"Model"|"模式":"模型"|g' swagger-ui-bundle.js
sed -i 's|"Schemas":"Models"|"模式列表":"模型列表"|g' swagger-ui-bundle.js
sed -i 's|"ScrollLock"|"ScrollLock"|g' swagger-ui-bundle.js
sed -i 's|"Secure random number generation is not supported by this browser.\nUse Chrome, Firefox or Internet Explorer 11"|"此浏览器不支持安全随机数生成.\n请使用 Chrome、Firefox 或 Internet Explorer 11"|g' swagger-ui-bundle.js
sed -i 's|"Select"|"Select"|g' swagger-ui-bundle.js
sed -i 's|"Send email to "|"发送电子邮件至 "|g' swagger-ui-bundle.js
sed -i 's|"Send empty value"|"发送空值"|g' swagger-ui-bundle.js
sed -i 's|"Server response"|"服务器响应"|g' swagger-ui-bundle.js
sed -i 's|"Servers"|"Servers"|g' swagger-ui-bundle.js
sed -i 's|"Side channel does not contain "|"Side channel does not contain "|g' swagger-ui-bundle.js
sed -i 's|"Skipped rendering: no `dom_id` or `domNode` was specified"|"Skipped rendering: no `dom_id` or `domNode` was specified"|g' swagger-ui-bundle.js
sed -i 's|"Snippets"|"Snippets"|g' swagger-ui-bundle.js
sed -i 's|"Store does not have a valid reducer. Make sure the argument passed to combineReducers is an object whose values are reducers."|"Store does not have a valid reducer. Make sure the argument passed to combineReducers is an object whose values are reducers."|g' swagger-ui-bundle.js
sed -i 's|"String Iterator"|"String Iterator"|g' swagger-ui-bundle.js
sed -i 's|"String"|"String"|g' swagger-ui-bundle.js
sed -i 's|"Suspense"|"Suspense"|g' swagger-ui-bundle.js
sed -i 's|"SuspenseList"|"SuspenseList"|g' swagger-ui-bundle.js
sed -i 's|"Symbol is not a constructor"|"Symbol is not a constructor"|g' swagger-ui-bundle.js
sed -i 's|"Symbol"|"Symbol"|g' swagger-ui-bundle.js
sed -i 's|"Terms of service"|"服务条款"|g' swagger-ui-bundle.js
sed -i 's|"Test operation failed"|"Test operation failed"|g' swagger-ui-bundle.js
sed -i 's|"Text"|"Text"|g' swagger-ui-bundle.js
sed -i 's|"The "|"The "|g' swagger-ui-bundle.js
sed -i 's|"The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "|"The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "|g' swagger-ui-bundle.js
sed -i 's|"The iterator does not provide a '\''throw'\'' method"|"The iterator does not provide a '\''throw'\'' method"|g' swagger-ui-bundle.js
sed -i 's|"The method doesn'\''t accept regular expressions"|"The method doesn'\''t accept regular expressions"|g' swagger-ui-bundle.js
sed -i 's|"These "|"These "|g' swagger-ui-bundle.js
sed -i 's|"Transformer error:"|"Transformer error:"|g' swagger-ui-bundle.js
sed -i 's|"Transition"|"Transition"|g' swagger-ui-bundle.js
sed -i 's|"Tried to remove a promisedPatch that isn'\''t there!"|"Tried to remove a promisedPatch that isn'\''t there!"|g' swagger-ui-bundle.js
sed -i 's|"Tried to resolve a relative URL, without having a basePath. path: '\''"|"Tried to resolve a relative URL, without having a basePath. path: '\''"|g' swagger-ui-bundle.js
sed -i 's|"TrustedTypes policy "|"TrustedTypes policy "|g' swagger-ui-bundle.js
sed -i 's|"Try it out "|"试试看 "|g' swagger-ui-bundle.js
sed -i 's|"Trying to access beyond buffer length"|"试图访问超出缓冲区长度"|g' swagger-ui-bundle.js
sed -i 's|"Type"|"类型"|g' swagger-ui-bundle.js
sed -i 's|"URL"|"URL"|g' swagger-ui-bundle.js
sed -i 's|"Unable to set a non-enumerable property on object."|"Unable to set a non-enumerable property on object."|g' swagger-ui-bundle.js
sed -i 's|"Undefined"|"Undefined"|g' swagger-ui-bundle.js
sed -i 's|"Unexpected "|"Unexpected "|g' swagger-ui-bundle.js
sed -i 's|"Unexpected situation"|"Unexpected situation"|g' swagger-ui-bundle.js
sed -i 's|"Unhandled case for value: '\''"|"Unhandled case for value: '\''"|g' swagger-ui-bundle.js
sed -i 's|"Unhandled error."|"未处理的错误."|g' swagger-ui-bundle.js
sed -i 's|"Unidentified"|"Unidentified"|g' swagger-ui-bundle.js
sed -i 's|"Unknown Type: "|"未知类型: "|g' swagger-ui-bundle.js
sed -i 's|"Unknown encoding: "|"未知编码: "|g' swagger-ui-bundle.js
sed -i 's|"Unknown error"|"未知错误"|g' swagger-ui-bundle.js
sed -i 's|"Unknown security definition type "|"未知的安全定义类型 "|g' swagger-ui-bundle.js
sed -i 's|"Unknown service name to point hashtag to: "|"将hashtag指向的未知服务名称: "|g' swagger-ui-bundle.js
sed -i 's|"Unknown service name to point mention to: "|"将mention指向的未知服务名称: "|g' swagger-ui-bundle.js
sed -i 's|"Unknown"|"Unknown"|g' swagger-ui-bundle.js
sed -i 's|"Unmatched ) at column "|"Unmatched ) at column "|g' swagger-ui-bundle.js
sed -i 's|"Unrecognized response type; displaying content as text."|"无法识别的响应类型； 将内容显示为文本."|g' swagger-ui-bundle.js
sed -i 's|"Unrecognized response type; unable to display."|"无法识别的响应类型； 无法显示."|g' swagger-ui-bundle.js
sed -i 's|"Unterminated character class"|"Unterminated character class"|g' swagger-ui-bundle.js
sed -i 's|"Unterminated group"|"Unterminated group"|g' swagger-ui-bundle.js
sed -i 's|"Updating absent value"|"正在更新缺失值"|g' swagger-ui-bundle.js
sed -i 's|"Value must be a DateTime"|"值必须是 DateTime"|g' swagger-ui-bundle.js
sed -i 's|"Value must be a Guid"|"值必须是 Guid"|g' swagger-ui-bundle.js
sed -i 's|"Value must be a file"|"值必须是 file"|g' swagger-ui-bundle.js
sed -i 's|"Value must be a number"|"值必须是 number"|g' swagger-ui-bundle.js
sed -i 's|"Value must be an integer"|"值必须是 integer"|g' swagger-ui-bundle.js
sed -i 's|"Value must be at least "|"值至少为 "|g' swagger-ui-bundle.js
sed -i 's|"on line "|"行号 "|g' swagger-ui-bundle.js
sed -i 's|"Value must be greater than "|"值必须大于 "|g' swagger-ui-bundle.js
sed -i 's|"Value must be less than "|"值必须小于 "|g' swagger-ui-bundle.js
sed -i 's|"Value must be no longer than "|"值不得超过 "|g' swagger-ui-bundle.js
sed -i 's|"Value must follow pattern "|"值必须遵循模式 "|g' swagger-ui-bundle.js
sed -i 's|"Value type "|"值类型 "|g' swagger-ui-bundle.js
sed -i 's|"Value"|"Value"|g' swagger-ui-bundle.js
sed -i 's|"WARNING: getDefinitionsByNames is deprecated and will be removed in the next major version."|"WARNING: getDefinitionsByNames is deprecated and will be removed in the next major version."|g' swagger-ui-bundle.js
sed -i 's|"Warning: UPDATE_EMPTY_PARAM_INCLUSION could not generate a paramKey."|"Warning: UPDATE_EMPTY_PARAM_INCLUSION could not generate a paramKey."|g' swagger-ui-bundle.js
sed -i 's|"Warning: invalid passwordType "|"警告：passwordType 无效 "|g' swagger-ui-bundle.js
sed -i 's|"We'\''ve reached a hard limit of "|"我们已经达到了硬性限制 "|g' swagger-ui-bundle.js
sed -i 's|"Weak"|"Weak"|g' swagger-ui-bundle.js
sed -i 's|"Webkit"|"Webkit"|g' swagger-ui-bundle.js
sed -i 's|"Window"|"Window"|g' swagger-ui-bundle.js
sed -i 's|"WithErrorBoundary("|"WithErrorBoundary("|g' swagger-ui-bundle.js
sed -i 's|"WithMappedContainer("|"WithMappedContainer("|g' swagger-ui-bundle.js
sed -i 's|"WithRoot("|"WithRoot("|g' swagger-ui-bundle.js
sed -i 's|"WithSystem("|"WithSystem("|g' swagger-ui-bundle.js
sed -i 's|"Wrong `remarkable` preset, check name/content"|"Wrong `remarkable` preset, check name/content"|g' swagger-ui-bundle.js
sed -i 's|"Wrong number of repetitions"|"Wrong number of repetitions"|g' swagger-ui-bundle.js
sed -i 's|"_update must be implemented by subclass"|"_update must be implemented by subclass"|g' swagger-ui-bundle.js
sed -i 's|"_writableState.buffer is deprecated. Use _writableState.getBuffer instead."|"_writableState.buffer is deprecated. Use _writableState.getBuffer instead."|g' swagger-ui-bundle.js
sed -i 's|"`CSS.escape` requires an argument."|"`CSS.escape` requires an argument."|g' swagger-ui-bundle.js
sed -i 's|"`splitRegex` must have the '\''g'\'' flag set"|"`splitRegex` must have the '\''g'\'' flag set"|g' swagger-ui-bundle.js
sed -i 's|"abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange seeked seeking stalled suspend timeupdate volumechange waiting"|"abort canplay canplaythrough durationchange emptied encrypted ended error loadeddata loadedmetadata loadstart pause play playing progress ratechange seeked seeking stalled suspend timeupdate volumechange waiting"|g' swagger-ui-bundle.js
sed -i 's|"argument should be a Buffer"|"argument should be a Buffer"|g' swagger-ui-bundle.js
sed -i 's|"base intrinsic for "|"base intrinsic for "|g' swagger-ui-bundle.js
sed -i 's|"can'\''t parse JSON.  Raw result:\n\n"|"无法解析 JSON。 原始结果:\n\n"|g' swagger-ui-bundle.js
sed -i 's|"cancel close invalid load scroll toggle"|"cancel close invalid load scroll toggle"|g' swagger-ui-bundle.js
sed -i 's|"clearTimeout has not been defined"|"clearTimeout has not been defined"|g' swagger-ui-bundle.js
sed -i 's|"could not read FormData body as blob"|"could not read FormData body as blob"|g' swagger-ui-bundle.js
sed -i 's|"could not read FormData body as text"|"could not read FormData body as text"|g' swagger-ui-bundle.js
sed -i 's|"createSelector expects all input-selectors to be functions, but received the following types: '"\["'"|"createSelector expects all input-selectors to be functions, but received the following types: '"\["'"|g' swagger-ui-bundle.js
sed -i 's|"debResolveSubtrees: don'\''t have a system to operate on, aborting."|"debResolveSubtrees: 没有可操作的系统，正在中止."|g' swagger-ui-bundle.js
sed -i 's|"error: could not generate yaml example"|"error: 无法生成 yaml 示例"|g' swagger-ui-bundle.js
sed -i 's|"fallback value for"|"fallback value for"|g' swagger-ui-bundle.js
sed -i 's|"falling back to prompt"|"falling back to prompt"|g' swagger-ui-bundle.js
sed -i 's|"false write response, pause"|"false write response, pause"|g' swagger-ui-bundle.js
sed -i 's|"first argument should be an array"|"first argument should be an array"|g' swagger-ui-bundle.js
sed -i 's|"forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"|"forceFrameRate takes a positive int between 0 and 125, forcing frame rates higher than 125 fps is not supported"|g' swagger-ui-bundle.js
sed -i 's|"if else foreach return do while until elseif begin for trap data dynamicparam end break throw param continue finally in switch exit filter try process catch hidden static parameter"|"if else foreach return do while until elseif begin for trap data dynamicparam end break throw param continue finally in switch exit filter try process catch hidden static parameter"|g' swagger-ui-bundle.js
sed -i 's|"if then else elif fi for while in do done case esac function"|"if then else elif fi for while in do done case esac function"|g' swagger-ui-bundle.js
sed -i 's|"invalid keyPath"|"invalid keyPath"|g' swagger-ui-bundle.js
sed -i 's|"is not of a type(s)"|"is not of a type(s)"|g' swagger-ui-bundle.js
sed -i 's|"length less than watermark"|"length less than watermark"|g' swagger-ui-bundle.js
sed -i 's|"linkify option is removed. Use linkify plugin instead:\n\nimport Remarkable from 'remarkable';\nimport linkify from 'remarkable/linkify';\nnew Remarkable().use(linkify)\n"|"linkify option is removed. Use linkify plugin instead:\n\nimport Remarkable from 'remarkable';\nimport linkify from 'remarkable/linkify';\nnew Remarkable().use(linkify)\n"|g' swagger-ui-bundle.js
sed -i 's|"map is read-only"|"map is read-only"|g' swagger-ui-bundle.js
sed -i 's|"maybeReadMore read 0"|"maybeReadMore read 0"|g' swagger-ui-bundle.js
sed -i 's|"oauth2RedirectUrl configuration is not passed. Oauth2 authorization cannot be performed."|"oauth2RedirectUrl configuration is not passed. Oauth2 authorization cannot be performed."|g' swagger-ui-bundle.js
sed -i 's|"offset is not uint"|"offset is not uint"|g' swagger-ui-bundle.js
sed -i 's|"out of range index"|"out of range index"|g' swagger-ui-bundle.js
sed -i 's|"paramToIdentifier: received a non-Im.Map parameter as input"|"paramToIdentifier: received a non-Im.Map parameter as input"|g' swagger-ui-bundle.js
sed -i 's|"pipe count=%d opts=%j"|"pipe count=%d opts=%j"|g' swagger-ui-bundle.js
sed -i 's|"pipe resume"|"pipe resume"|g' swagger-ui-bundle.js
sed -i 's|"potential infinite loop, way more iterations than matches"|"potential infinite loop, way more iterations than matches"|g' swagger-ui-bundle.js
sed -i 's|"process.binding is not supported"|"process.binding is not supported"|g' swagger-ui-bundle.js
sed -i 's|"process.chdir is not supported"|"process.chdir is not supported"|g' swagger-ui-bundle.js
sed -i 's|"readable nexttick read 0"|"readable nexttick read 0"|g' swagger-ui-bundle.js
sed -i 's|"reading or ended"|"reading or ended"|g' swagger-ui-bundle.js
sed -i 's|"requested too many random bytes"|"请求了太多随机字节"|g' swagger-ui-bundle.js
sed -i 's|"response status is "|"响应状态是 "|g' swagger-ui-bundle.js
sed -i 's|"setTimeout has not been defined"|"setTimeout 尚未被定义"|g' swagger-ui-bundle.js
sed -i 's|"should be a"|"应该是一个"|g' swagger-ui-bundle.js
sed -i 's|"sourceEnd out of bounds"|"sourceEnd out of bounds"|g' swagger-ui-bundle.js
sed -i 's|"specActions.resolveSpec is deprecated since v3.10.0 and will be removed in v4.0.0; use requestResolvedSubtree instead!"|"specActions.resolveSpec is deprecated since v3.10.0 and will be removed in v4.0.0; use requestResolvedSubtree instead!"|g' swagger-ui-bundle.js
sed -i 's|"targetStart out of bounds"|"targetStart out of bounds"|g' swagger-ui-bundle.js
sed -i 's|"this hasn'\''t been initialised - super() hasn'\''t been called"|"this hasn'\''t been initialised - super() hasn'\''t been called"|g' swagger-ui-bundle.js
sed -i 's|"try statement without catch or finally"|"try statement without catch or finally"|g' swagger-ui-bundle.js
sed -i 's|"trying IE specific stuff"|"trying IE specific stuff"|g' swagger-ui-bundle.js
sed -i 's|"unable to copy using clipboardData: "|"unable to copy using clipboardData: "|g' swagger-ui-bundle.js
sed -i 's|"unable to copy using execCommand: "|"unable to copy using execCommand: "|g' swagger-ui-bundle.js
sed -i 's|"unable to use e.clipboardData"|"unable to use e.clipboardData"|g' swagger-ui-bundle.js
sed -i 's|"unexpected result: SET_REQUEST_BODY_VALIDATE_ERROR"|"unexpected result: SET_REQUEST_BODY_VALIDATE_ERROR"|g' swagger-ui-bundle.js
sed -i 's|"useUnsafeMarkdown display configuration parameter is deprecated since >3.26.0 and will be removed in v4.0.0."|"useUnsafeMarkdown display configuration parameter is deprecated since >3.26.0 and will be removed in v4.0.0."|g' swagger-ui-bundle.js
sed -i 's|"val must be string, number or Buffer"|"val must be string, number or Buffer"|g' swagger-ui-bundle.js
sed -i 's|"while if switch catch for"|"while if switch catch for"|g' swagger-ui-bundle.js
sed -i 's|"wrapActions needs to return a function that returns a new function (ie the wrapped action)"|"wrapActions needs to return a function that returns a new function (ie the wrapped action)"|g' swagger-ui-bundle.js
sed -i 's|"wrapSelector needs to return a function that returns a new function (ie the wrapped action)"|"wrapSelector needs to return a function that returns a new function (ie the wrapped action)"|g' swagger-ui-bundle.js
sed -i 's|"\[ Base URL: "|"\[ 基础地址: "|g' swagger-ui-bundle.js
sed -i 's|"Unable to render this definition"|"无法呈现此定义"|g' swagger-ui-bundle.js
sed -i 's|"The provided definition does not specify a valid version field."|"提供的定义未指定有效的版本字段."|g' swagger-ui-bundle.js
sed -i 's|"Please indicate a valid Swagger or OpenAPI version field. Supported version fields are "|"请指明有效的 Swagger 或 OpenAPI 版本字段。支持的版本字段是 "|g' swagger-ui-bundle.js
sed -i 's|" and those that match "|" 和那些匹配的 "|g' swagger-ui-bundle.js
sed -i 's|" (for example, "|" (例如, "|g' swagger-ui-bundle.js
sed -i 's|"duplicated mapping key"|"重复的映射键"|g' swagger-ui-bundle.js
sed -i 's|"duplication of a tag property"|"重复的标签属性"|g' swagger-ui-bundle.js
sed -i 's|"duplication of an anchor property"|"重复的锚属性"|g' swagger-ui-bundle.js


# swagger-ui-standalone-preset.js
echo '汉化文件: swagger-ui-standalone-preset.js'
# [不可改]sed -i 's|"Fallback"|"回退"|g' swagger-ui-standalone-preset.js
# sed -i 's|"Range []"|"Range []"|g' swagger-ui-standalone-preset.js
# sed -i 's|"Repeat []"|"Repeat []"|g' swagger-ui-standalone-preset.js
# sed -i 's|"call pause flowing=%j"|"call pause flowing=%j"|g' swagger-ui-standalone-preset.js
# sed -i 's|"duplication of %YAML directive"|"duplication of %YAML directive"|g' swagger-ui-standalone-preset.js
sed -i 's|" Iterator"|" Iterator"|g' swagger-ui-standalone-preset.js
sed -i 's|" argument"|" argument"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not a constructor"|" 不是构造函数"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not a function"|" 不是一个函数"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not a symbol"|" 不是一个符号"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not an object"|" 不是一个对象"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not iterable"|" 不可迭代"|g' swagger-ui-standalone-preset.js
sed -i 's|" is not supported (we accept pull requests)"|" 不被支持（我们接受拉取请求）"|g' swagger-ui-standalone-preset.js
sed -i 's|"(unknown reason)"|"(未知原因)"|g' swagger-ui-standalone-preset.js
sed -i 's|". Received type "|". Received type "|g' swagger-ui-standalone-preset.js
sed -i 's|"Abstract"|"Abstract"|g' swagger-ui-standalone-preset.js
sed -i 's|"Anything can be here"|"什么都可以在这里"|g' swagger-ui-standalone-preset.js
sed -i 's|"Argument must be a Buffer"|"参数必须是Buffer"|g' swagger-ui-standalone-preset.js
sed -i 's|"Arguments"|"Arguments"|g' swagger-ui-standalone-preset.js
sed -i 's|"Array Iterator"|"Array Iterator"|g' swagger-ui-standalone-preset.js
sed -i 's|"Array"|"Array"|g' swagger-ui-standalone-preset.js
sed -i 's|"At least one callback required"|"At least one callback required"|g' swagger-ui-standalone-preset.js
sed -i 's|"Attempt to access memory outside buffer bounds"|"Attempt to access memory outside buffer bounds"|g' swagger-ui-standalone-preset.js
sed -i 's|"Attempt to allocate Buffer larger than maximum size: 0x"|"Attempt to allocate Buffer larger than maximum size: 0x"|g' swagger-ui-standalone-preset.js
sed -i 's|"Attempt to write outside buffer bounds"|"Attempt to write outside buffer bounds"|g' swagger-ui-standalone-preset.js
sed -i 's|"BaseLayout"|"BaseLayout"|g' swagger-ui-standalone-preset.js
sed -i 's|"BigInt not supported"|"BigInt not supported"|g' swagger-ui-standalone-preset.js
sed -i 's|"Buffer size must be a multiple of 16-bits"|"Buffer size must be a multiple of 16-bits"|g' swagger-ui-standalone-preset.js
sed -i 's|"Buffer size must be a multiple of 32-bits"|"Buffer size must be a multiple of 32-bits"|g' swagger-ui-standalone-preset.js
sed -i 's|"Buffer size must be a multiple of 64-bits"|"Buffer size must be a multiple of 64-bits"|g' swagger-ui-standalone-preset.js
sed -i 's|"Buffer"|"Buffer"|g' swagger-ui-standalone-preset.js
sed -i 's|"Buffer.write(string, encoding, offset[, length]) is no longer supported"|"Buffer.write(string, encoding, offset[, length]) is no longer supported"|g' swagger-ui-standalone-preset.js
sed -i 's|"Button"|"Button"|g' swagger-ui-standalone-preset.js
sed -i 's|"Can'\''t call method on "|"Can'\''t call method on "|g' swagger-ui-standalone-preset.js
sed -i 's|"Can'\''t convert object to primitive value"|"Can'\''t convert object to primitive value"|g' swagger-ui-standalone-preset.js
sed -i 's|"Can'\''t set "|"Can'\''t set "|g' swagger-ui-standalone-preset.js
sed -i 's|"Cannot call "|"Cannot call "|g' swagger-ui-standalone-preset.js
sed -i 's|"Cannot call a class as a function"|"Cannot call a class as a function"|g' swagger-ui-standalone-preset.js
sed -i 's|"Cannot perform this action with an infinite size."|"Cannot perform this action with an infinite size."|g' swagger-ui-standalone-preset.js
sed -i 's|"Cannot set on an immutable record."|"Cannot set on an immutable record."|g' swagger-ui-standalone-preset.js
sed -i 's|"Cannot step a Range by 0"|"Cannot step a Range by 0"|g' swagger-ui-standalone-preset.js
sed -i 's|"Col"|"Col"|g' swagger-ui-standalone-preset.js
sed -i 's|"Container"|"Container"|g' swagger-ui-standalone-preset.js
sed -i 's|"DataView"|"DataView"|g' swagger-ui-standalone-preset.js
sed -i 's|"Date resolve error"|"Date resolve error"|g' swagger-ui-standalone-preset.js
sed -i 's|"Derived constructors may only return object or undefined"|"Derived constructors may only return object or undefined"|g' swagger-ui-standalone-preset.js
sed -i 's|"ErrorBoundary"|"ErrorBoundary"|g' swagger-ui-standalone-preset.js
sed -i 's|"Expected Array or iterable object of [k, v] entries, or keyed object: "|"Expected Array or iterable object of [k, v] entries, or keyed object: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Expected Array or iterable object of values, or keyed object: "|"Expected Array or iterable object of values, or keyed object: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Expected Array or iterable object of values: "|"Expected Array or iterable object of values: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Expected [K, V] tuple: "|"Expected [K, V] tuple: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Expected iterable or array-like: "|"Expected iterable or array-like: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Explore"|"浏览"|g' swagger-ui-standalone-preset.js
sed -i 's|"File"|"文件"|g' swagger-ui-standalone-preset.js
sed -i 's|"Function yaml."|"Function yaml."|g' swagger-ui-standalone-preset.js
sed -i 's|"Function"|"Function"|g' swagger-ui-standalone-preset.js
sed -i 's|"Incompatible receiver, "|"Incompatible receiver, "|g' swagger-ui-standalone-preset.js
sed -i 's|"Incorrect invocation"|"Incorrect invocation"|g' swagger-ui-standalone-preset.js
sed -i 's|"Index out of range"|"Index out of range"|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|"Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid code point"|"Invalid code point"|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid regular expression: /"|"Invalid regular expression: /"|g' swagger-ui-standalone-preset.js
sed -i 's|"Invalid string. Length must be a multiple of 4"|"Invalid string. Length must be a multiple of 4"|g' swagger-ui-standalone-preset.js
sed -i 's|"Link"|"Link"|g' swagger-ui-standalone-preset.js
sed -i 's|"Maximum allowed index exceeded"|"Maximum allowed index exceeded"|g' swagger-ui-standalone-preset.js
sed -i 's|"Minified React error #"|"Minified React error #"|g' swagger-ui-standalone-preset.js
sed -i 's|"Missing value for key: "|"Missing value for key: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Module"|"Module"|g' swagger-ui-standalone-preset.js
sed -i 's|"Non-extensible objects are not allowed as keys."|"Non-extensible objects are not allowed as keys."|g' swagger-ui-standalone-preset.js
sed -i 's|"Nothing to repeat at column "|"Nothing to repeat at column "|g' swagger-ui-standalone-preset.js
sed -i 's|"Object already initialized"|"Object already initialized"|g' swagger-ui-standalone-preset.js
sed -i 's|"Object"|"Object"|g' swagger-ui-standalone-preset.js
sed -i 's|"Object.assign cannot be called with null or undefined"|"Object.assign cannot be called with null or undefined"|g' swagger-ui-standalone-preset.js
sed -i 's|"Out of range index"|"Out of range index"|g' swagger-ui-standalone-preset.js
sed -i 's|"Possible EventEmitter memory leak detected. "|"Possible EventEmitter memory leak detected. "|g' swagger-ui-standalone-preset.js
sed -i 's|"Promise"|"Promise"|g' swagger-ui-standalone-preset.js
sed -i 's|"Prototype"|"Prototype"|g' swagger-ui-standalone-preset.js
sed -i 's|"Readable.from is not available in the browser"|"Readable.from is not available in the browser"|g' swagger-ui-standalone-preset.js
sed -i 's|"Record"|"Record"|g' swagger-ui-standalone-preset.js
sed -i 's|"Reduce of empty array with no initial value"|"Reduce of empty array with no initial value"|g' swagger-ui-standalone-preset.js
sed -i 's|"Reduce of empty map with no initial value"|"Reduce of empty map with no initial value"|g' swagger-ui-standalone-preset.js
sed -i 's|"Reflect"|"Reflect"|g' swagger-ui-standalone-preset.js
sed -i 's|"Row"|"Row"|g' swagger-ui-standalone-preset.js
sed -i 's|"Schema.extend argument should be a Type, [ Type ], or a schema definition ({ implicit: [...], explicit: [...] })"|"Schema.extend argument should be a Type, [ Type ], or a schema definition ({ implicit: [...], explicit: [...] })"|g' swagger-ui-standalone-preset.js
sed -i 's|"Secure random number generation is not supported by this browser.\nUse Chrome, Firefox or Internet Explorer 11"|"Secure random number generation is not supported by this browser.\nUse Chrome, Firefox or Internet Explorer 11"|g' swagger-ui-standalone-preset.js
sed -i 's|"Select a definition"|"请选择一个规范"|g' swagger-ui-standalone-preset.js
sed -i 's|"Specified list of YAML types (or a single Type object) contains a non-Type object."|"Specified list of YAML types (or a single Type object) contains a non-Type object."|g' swagger-ui-standalone-preset.js
sed -i 's|"String Iterator"|"String Iterator"|g' swagger-ui-standalone-preset.js
sed -i 's|"String"|"String"|g' swagger-ui-standalone-preset.js
sed -i 's|"Symbol is not a constructor"|"Symbol is not a constructor"|g' swagger-ui-standalone-preset.js
sed -i 's|"Symbol"|"Symbol"|g' swagger-ui-standalone-preset.js
sed -i 's|"Symbol("|"Symbol("|g' swagger-ui-standalone-preset.js
sed -i 's|"Symbol."|"Symbol."|g' swagger-ui-standalone-preset.js
sed -i 's|"TAG directive accepts exactly two arguments"|"TAG directive accepts exactly two arguments"|g' swagger-ui-standalone-preset.js
sed -i 's|"Th"|"Th"|g' swagger-ui-standalone-preset.js
sed -i 's|"The "|"The "|g' swagger-ui-standalone-preset.js
sed -i 's|"The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "|"The first argument must be one of type string, Buffer, ArrayBuffer, Array, or Array-like Object. Received type "|g' swagger-ui-standalone-preset.js
sed -i 's|"The method doesn'\''t accept regular expressions"|"The method doesn'\''t accept regular expressions"|g' swagger-ui-standalone-preset.js
sed -i 's|"There is a multi type in the implicit list of a schema. Multi tags can only be listed as explicit."|"There is a multi type in the implicit list of a schema. Multi tags can only be listed as explicit."|g' swagger-ui-standalone-preset.js
sed -i 's|"Topbar"|"Topbar"|g' swagger-ui-standalone-preset.js
sed -i 's|"True"|"True"|g' swagger-ui-standalone-preset.js
sed -i 's|"Trying to access beyond buffer length"|"Trying to access beyond buffer length"|g' swagger-ui-standalone-preset.js
sed -i 's|"Unable to set a non-enumerable property on object."|"Unable to set a non-enumerable property on object."|g' swagger-ui-standalone-preset.js
sed -i 's|"Undefined"|"Undefined"|g' swagger-ui-standalone-preset.js
sed -i 's|"Unhandled error."|"未处理的错误."|g' swagger-ui-standalone-preset.js
sed -i 's|"Unknown Type: "|"未知类型: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Unknown encoding: "|"未知编码: "|g' swagger-ui-standalone-preset.js
sed -i 's|"Unmatched ) at column "|"Unmatched ) at column "|g' swagger-ui-standalone-preset.js
sed -i 's|"Unterminated character class"|"Unterminated character class"|g' swagger-ui-standalone-preset.js
sed -i 's|"Unterminated group"|"Unterminated group"|g' swagger-ui-standalone-preset.js
sed -i 's|"Updating absent value"|"Updating absent value"|g' swagger-ui-standalone-preset.js
sed -i 's|"Value type "|"Value type "|g' swagger-ui-standalone-preset.js
sed -i 's|"Weak"|"Weak"|g' swagger-ui-standalone-preset.js
sed -i 's|"WeakMap"|"WeakMap"|g' swagger-ui-standalone-preset.js
sed -i 's|"Window"|"Window"|g' swagger-ui-standalone-preset.js
sed -i 's|"WithErrorBoundary("|"WithErrorBoundary("|g' swagger-ui-standalone-preset.js
sed -i 's|"YAML directive accepts exactly one argument"|"YAML directive accepts exactly one argument"|g' swagger-ui-standalone-preset.js
sed -i 's|"_update must be implemented by subclass"|"_update must be implemented by subclass"|g' swagger-ui-standalone-preset.js
sed -i 's|"_writableState.buffer is deprecated. Use _writableState.getBuffer instead."|"_writableState.buffer is deprecated. Use _writableState.getBuffer instead."|g' swagger-ui-standalone-preset.js
sed -i 's|"`CSS.escape` requires an argument."|"`CSS.escape` requires an argument."|g' swagger-ui-standalone-preset.js
sed -i 's|"a line break is expected"|"a line break is expected"|g' swagger-ui-standalone-preset.js
sed -i 's|"a whitespace character is expected after the key-value separator within a block mapping"|"a whitespace character is expected after the key-value separator within a block mapping"|g' swagger-ui-standalone-preset.js
sed -i 's|"argument should be a Buffer"|"argument should be a Buffer"|g' swagger-ui-standalone-preset.js
sed -i 's|"bad explicit indentation width of a block scalar; it cannot be less than one"|"bad explicit indentation width of a block scalar; it cannot be less than one"|g' swagger-ui-standalone-preset.js
sed -i 's|"bad indentation of a mapping entry"|"bad indentation of a mapping entry"|g' swagger-ui-standalone-preset.js
sed -i 's|"bad indentation of a sequence entry"|"bad indentation of a sequence entry"|g' swagger-ui-standalone-preset.js
sed -i 's|"can not read a block mapping entry; a multiline key may not be an implicit key"|"can not read a block mapping entry; a multiline key may not be an implicit key"|g' swagger-ui-standalone-preset.js
sed -i 's|"can not read an implicit mapping pair; a colon is missed"|"can not read an implicit mapping pair; a colon is missed"|g' swagger-ui-standalone-preset.js
sed -i 's|"cannot merge mappings; the provided source object is unacceptable"|"cannot merge mappings; the provided source object is unacceptable"|g' swagger-ui-standalone-preset.js
sed -i 's|"cannot resolve a node with !<"|"cannot resolve a node with !<"|g' swagger-ui-standalone-preset.js
sed -i 's|"clearTimeout has not been defined"|"clearTimeout has not been defined"|g' swagger-ui-standalone-preset.js
sed -i 's|"code point within a string may not be greater than 0xFFFFFFFF"|"code point within a string may not be greater than 0xFFFFFFFF"|g' swagger-ui-standalone-preset.js
sed -i 's|"deficient indentation"|"deficient indentation"|g' swagger-ui-standalone-preset.js
sed -i 's|"directive name must not be less than one character in length"|"directive name must not be less than one character in length"|g' swagger-ui-standalone-preset.js
sed -i 's|"directives end mark is expected"|"directives end mark is expected"|g' swagger-ui-standalone-preset.js
sed -i 's|"duplicated mapping key"|"重复的映射键"|g' swagger-ui-standalone-preset.js
sed -i 's|"duplication of a tag property"|"重复的标签属性"|g' swagger-ui-standalone-preset.js
sed -i 's|"duplication of an anchor property"|"重复的锚属性"|g' swagger-ui-standalone-preset.js
sed -i 's|"end of the stream or a document separator is expected"|"end of the stream or a document separator is expected"|g' swagger-ui-standalone-preset.js
sed -i 's|"expected a single document in the stream, but found more"|"expected a single document in the stream, but found more"|g' swagger-ui-standalone-preset.js
sed -i 's|"expected hexadecimal character"|"expected hexadecimal character"|g' swagger-ui-standalone-preset.js
sed -i 's|"expected the node content, but found '\'','\''"|"expected the node content, but found '\'','\''"|g' swagger-ui-standalone-preset.js
sed -i 's|"expected valid JSON character"|"expected valid JSON character"|g' swagger-ui-standalone-preset.js
sed -i 's|"false write response, pause"|"false write response, pause"|g' swagger-ui-standalone-preset.js
sed -i 's|"ill-formed argument of the YAML directive"|"ill-formed argument of the YAML directive"|g' swagger-ui-standalone-preset.js
sed -i 's|"ill-formed tag handle (first argument) of the TAG directive"|"ill-formed tag handle (first argument) of the TAG directive"|g' swagger-ui-standalone-preset.js
sed -i 's|"ill-formed tag prefix (second argument) of the TAG directive"|"ill-formed tag prefix (second argument) of the TAG directive"|g' swagger-ui-standalone-preset.js
sed -i 's|"impossible error: invalid scalar style"|"impossible error: invalid scalar style"|g' swagger-ui-standalone-preset.js
sed -i 's|"incomplete explicit mapping pair; a key node is missed; or followed by a non-tabulated empty line"|"incomplete explicit mapping pair; a key node is missed; or followed by a non-tabulated empty line"|g' swagger-ui-standalone-preset.js
sed -i 's|"invalid keyPath"|"invalid keyPath"|g' swagger-ui-standalone-preset.js
sed -i 's|"length less than watermark"|"length less than watermark"|g' swagger-ui-standalone-preset.js
sed -i 's|"maybeReadMore read 0"|"maybeReadMore read 0"|g' swagger-ui-standalone-preset.js
sed -i 's|"name of an alias node must contain at least one character"|"name of an alias node must contain at least one character"|g' swagger-ui-standalone-preset.js
sed -i 's|"name of an anchor node must contain at least one character"|"name of an anchor node must contain at least one character"|g' swagger-ui-standalone-preset.js
sed -i 's|"need readable"|"need readable"|g' swagger-ui-standalone-preset.js
sed -i 's|"nested arrays are not supported inside keys"|"nested arrays are not supported inside keys"|g' swagger-ui-standalone-preset.js
sed -i 's|"non-ASCII line breaks are interpreted as content"|"non-ASCII line breaks are interpreted as content"|g' swagger-ui-standalone-preset.js
sed -i 's|"not assigned to a parent!"|"not assigned to a parent!"|g' swagger-ui-standalone-preset.js
sed -i 's|"null byte is not allowed in input"|"null byte is not allowed in input"|g' swagger-ui-standalone-preset.js
sed -i 's|"offset is not uint"|"offset is not uint"|g' swagger-ui-standalone-preset.js
sed -i 's|"out of range index"|"out of range index"|g' swagger-ui-standalone-preset.js
sed -i 's|"pipe count=%d opts=%j"|"pipe count=%d opts=%j"|g' swagger-ui-standalone-preset.js
sed -i 's|"pipe resume"|"pipe resume"|g' swagger-ui-standalone-preset.js
sed -i 's|"process.binding is not supported"|"process.binding is not supported"|g' swagger-ui-standalone-preset.js
sed -i 's|"process.chdir is not supported"|"process.chdir is not supported"|g' swagger-ui-standalone-preset.js
sed -i 's|"readable nexttick read 0"|"readable nexttick read 0"|g' swagger-ui-standalone-preset.js
sed -i 's|"reading or ended"|"reading or ended"|g' swagger-ui-standalone-preset.js
sed -i 's|"requested too many random bytes"|"requested too many random bytes"|g' swagger-ui-standalone-preset.js
sed -i 's|"setTimeout has not been defined"|"setTimeout has not been defined"|g' swagger-ui-standalone-preset.js
sed -i 's|"sortKeys must be a boolean or a function"|"sortKeys must be a boolean or a function"|g' swagger-ui-standalone-preset.js
sed -i 's|"sourceEnd out of bounds"|"sourceEnd out of bounds"|g' swagger-ui-standalone-preset.js
sed -i 's|"tab characters must not be used in indentation"|"tab characters must not be used in indentation"|g' swagger-ui-standalone-preset.js
sed -i 's|"tag name cannot contain such characters: "|"tag name cannot contain such characters: "|g' swagger-ui-standalone-preset.js
sed -i 's|"tag name is malformed: "|"tag name is malformed: "|g' swagger-ui-standalone-preset.js
sed -i 's|"tag prefix is malformed: "|"tag prefix is malformed: "|g' swagger-ui-standalone-preset.js
sed -i 's|"tag suffix cannot contain exclamation marks"|"tag suffix cannot contain exclamation marks"|g' swagger-ui-standalone-preset.js
sed -i 's|"tag suffix cannot contain flow indicator characters"|"tag suffix cannot contain flow indicator characters"|g' swagger-ui-standalone-preset.js
sed -i 's|"targetStart out of bounds"|"targetStart out of bounds"|g' swagger-ui-standalone-preset.js
sed -i 's|"the stream contains non-printable characters"|"the stream contains non-printable characters"|g' swagger-ui-standalone-preset.js
sed -i 's|"this component"|"this component"|g' swagger-ui-standalone-preset.js
sed -i 's|"this hasn'\''t been initialised - super() hasn'\''t been called"|"this hasn'\''t been initialised - super() hasn'\''t been called"|g' swagger-ui-standalone-preset.js
sed -i 's|"unacceptable YAML version of the document"|"unacceptable YAML version of the document"|g' swagger-ui-standalone-preset.js
sed -i 's|"unacceptable kind of an object to dump "|"unacceptable kind of an object to dump "|g' swagger-ui-standalone-preset.js
sed -i 's|"unacceptable node kind for !<"|"unacceptable node kind for !<"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the document within a double quoted scalar"|"unexpected end of the document within a double quoted scalar"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the document within a single quoted scalar"|"unexpected end of the document within a single quoted scalar"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the stream within a double quoted scalar"|"unexpected end of the stream within a double quoted scalar"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the stream within a flow collection"|"unexpected end of the stream within a flow collection"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the stream within a single quoted scalar"|"unexpected end of the stream within a single quoted scalar"|g' swagger-ui-standalone-preset.js
sed -i 's|"unexpected end of the stream within a verbatim tag"|"unexpected end of the stream within a verbatim tag"|g' swagger-ui-standalone-preset.js
sed -i 's|"unknown escape sequence"|"unknown escape sequence"|g' swagger-ui-standalone-preset.js
sed -i 's|"unknown tag !<"|"unknown tag !<"|g' swagger-ui-standalone-preset.js
sed -i 's|"unsupported YAML version of the document"|"unsupported YAML version of the document"|g' swagger-ui-standalone-preset.js
sed -i 's|"val must be string, number or Buffer"|"val must be string, number or Buffer"|g' swagger-ui-standalone-preset.js


# 关闭联网API验证
sed -i 's|"https://validator.swagger.io/validator"|""|g' swagger-ui-bundle.js
sed -i 's|"https://validator.swagger.io/validator"|""|g' swagger-ui-standalone-preset.js


# 精简代码
echo '精简代码...'
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui.css.map
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui.js.map
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui-bundle.js.map
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui-standalone-preset.js.map
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui-es-bundle.js.map
echo '{"version":3,"sources":[],"names":[],"mappings":"","file":"","sourcesContent":[],"sourceRoot":""}' > swagger-ui-es-bundle-core.js.map



<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/backend_common.jsp"/>
    <jsp:include page="/common/page.jsp"/>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>

<div class="page-header">
    <h1>
        权限操作记录
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            管理权限相关模块更新历史
        </small>
    </h1>
</div>
<div class="main-content-inner">
    <div class="col-sm-12">
        <div class="col-xs-12">
            <div class="table-header">
                操作列表
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="dataTables_length" id="dynamic-table_length"><label>
                                展示
                                <select id="pageSize" name="dynamic-table_length" aria-controls="dynamic-table" class="form-control input-sm">
                                    <option value="10">10</option>
                                    <option value="25">25</option>
                                    <option value="50">50</option>
                                    <option value="100">100</option>
                                </select> 条记录 </label>
                                <label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类型
                                    <select id="search-type" name="dynamic-table_length" aria-controls="dynamic-table" class="form-control input-sm">
                                        <option value="">全部</option>
                                        <option value="1">部门</option>
                                        <option value="2">用户</option>
                                        <option value="3">权限模块</option>
                                        <option value="4">权限</option>
                                        <option value="5">角色</option>
                                        <option value="6">角色权限关系</option>
                                        <option value="7">角色用户关系</option>
                                    </select></label>

                                <input id="search-operator" type="search" name="operator" class="form-control input-sm" placeholder="操作者" aria-controls="dynamic-table">
                                <input id="search-before" type="search" name="beforeSeg" class="form-control input-sm" placeholder="操作前的值" aria-controls="dynamic-table">
                                <input id="search-after" type="search" name="afterSeg" class="form-control input-sm" placeholder="操作后的值" aria-controls="dynamic-table">
                                <input id="search-from"type="search" name="fromTime" class="form-control input-sm" placeholder="开始时间" aria-controls="dynamic-table"> ~
                                <input id="search-to" type="search" name="toTime" class="form-control input-sm" placeholder="结束时间" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-info fa fa-check research" style="margin-bottom: 6px;" type="button">
                                    刷新
                                </button>
                            </div>
                        </div>
                        <table id="dynamic-table" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                               aria-describedby="dynamic-table_info" style="font-size:14px">
                            <thead>
                            <tr role="row">
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                    操作者
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                    操作类型
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                    操作时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                    操作前的值
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1">
                                    操作后的值
                                </th>
                                <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""></th>
                            </tr>
                            </thead>
                            <tbody id="logList"></tbody>
                        </table>
                        <div class="row" id="logPage">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script id="logListTemplate" type="x-tmpl-mustache">
{{#logList}}
<tr role="row" class="config odd" data-id="{{id}}"><!--even -->
    <td>{{operator}}</td>
    <td>{{#showType}}{{/showType}}</td>
    <td>{{#showDate}}{{/showDate}}</td>
    <td><pre>{{#showOldValue}}{{/showOldValue}}</pre></td>
    <td><pre>{{#showNewValue}}{{/showNewValue}}</pre></td>
    <td>
        <div class="hidden-sm hidden-xs action-buttons">
            <a class="green log-edit" href="#" data-id="{{id}}">
                <i class="ace-icon fa fa-pencil bigger-100"></i>
            </a>
        </div>
    </td>
</tr>
{{/logList}}
</script>

    <script type="text/javascript">
        $(function () {
            var logListTemplate = $('#logListTemplate').html();
            Mustache.parse(logListTemplate);
            var logMap = {};

            loadLogList();

            $(".research").click(function (e) {
                e.preventDefault();
                loadLogList();
            });

            function loadLogList() {
                var pageSize = $("#pageSize").val();
                var pageNo = $("#logPage .pageNo").val() || 1;
                var url = "/sys/log/page.json";
                var beforeSeg = $("#search-before").val();
                var afterSeg = $("#search-after").val();
                var operator = $("#search-operator").val();
                var fromTime = $("#search-from").val();
                var toTime = $("#search-to").val();
                var type = $("#search-type").val();
                $.ajax({
                    url: url,
                    data: {
                        pageNo: pageNo,
                        pageSize: pageSize,
                        beforeSeg: beforeSeg,
                        afterSeg : afterSeg,
                        operator : operator,
                        fromTime: fromTime,
                        toTime: toTime,
                        type: type
                    },
                    type: 'POST',
                    success: function (result) {
                        renderLogListAndPage(result, url);
                    }
                });
            }

            function renderLogListAndPage(result, url) {
                if (result.ret) {
                    if (result.data.total > 0) {
                        var rendered = Mustache.render(logListTemplate, {
                            "logList": result.data.data,
                            "showType": function () {
                                return function (text, render) {
                                    var typeStr = "";
                                    switch (this.type) {
                                        case 1: typeStr = "部门";break;
                                        case 2: typeStr = "用户";break;
                                        case 3: typeStr = "权限模块";break;
                                        case 4: typeStr = "权限点";break;
                                        case 5: typeStr = "角色";break;
                                        case 6: typeStr = "角色权限关系";break;
                                        case 7: typeStr = "角色用户关系";break;
                                        default: typeStr = "未知";
                                    }
                                    return typeStr;
                                }
                            },
                            "showDate" :function () {
                                return function (text, render) {
                                    return new Date(this.operateTime).Format("yyyy-MM-dd hh:mm:ss");
                                }
                            },
                            "showOldValue": function () {
                                return function (text, render) {
                                    return this.oldValue ? ((this.type == 6 || this.type == 7) ? this.oldValue : formatJson(this.oldValue)) : '无';
                                }
                            },
                            "showNewValue": function () {
                                return function (text, render) {
                                    return this.newValue ? ((this.type == 6 || this.type == 7) ? this.newValue : formatJson(this.newValue)) : '无';
                                }
                            }
                        });
                        $('#logList').html(rendered);
                        $.each(result.data.data, function (i, log) {
                            logMap[log.id] = log;
                        });
                    } else {
                        $('#logList').html('');
                    }
                    bindLogClick();
                    var pageSize = $("#pageSize").val();
                    var pageNo = $("#logPage .pageNo").val() || 1;
                    renderPage(url, result.data.total, pageNo, pageSize, result.data.total > 0 ? result.data.data.length : 0, "logPage", renderLogListAndPage);
                } else {
                    showMessage("获取权限操作历史列表", result.msg, false);
                }
            }

            function bindLogClick() {
                $(".log-edit").click(function (e) {
                    e.preventDefault();
                    var logId = $(this).attr("data-id"); // 选中的log id
                    console.log(logId);
                    if (confirm("确定要还原这个操作吗?")) {
                        $.ajax({
                            url: "/sys/log/recover.json",
                            data: {
                                id: logId
                            },
                            success: function (result) {
                                if (result.ret) {
                                    showMessage("还原历史记录", "操作成功", true);
                                    loadLogList();
                                } else {
                                    showMessage("还原历史记录", result.msg, false);
                                }
                            }
                        });
                    }
                });
            }
            Date.prototype.Format = function (fmt) { //author: meizz
                var o = {
                    "M+": this.getMonth() + 1, //月份
                    "d+": this.getDate(), //日
                    "h+": this.getHours(), //小时
                    "m+": this.getMinutes(), //分
                    "s+": this.getSeconds(), //秒
                    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                    "S": this.getMilliseconds() //毫秒
                };
                if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
                for (var k in o)
                    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
                return fmt;
            };
            var formatJson = function(json, options) {
                if(json == '') return '';
                var reg = null,
                    formatted = '',
                    pad = 0,
                    PADDING = '    '; // one can also use '\t' or a different number of spaces

                // optional settings
                options = options || {};
                // remove newline where '{' or '[' follows ':'
                options.newlineAfterColonIfBeforeBraceOrBracket = (options.newlineAfterColonIfBeforeBraceOrBracket === true) ? true : false;
                // use a space after a colon
                options.spaceAfterColon = (options.spaceAfterColon === false) ? false : true;

                // begin formatting...
                if (typeof json !== 'string') {
                    // make sure we start with the JSON as a string
                    json = JSON.stringify(json);
                } else {
                    // is already a string, so parse and re-stringify in order to remove extra whitespace
                    json = JSON.parse(json);
                    json = JSON.stringify(json);
                }

                // add newline before and after curly braces
                reg = /([\{\}])/g;
                json = json.replace(reg, '\r\n$1\r\n');

                // add newline before and after square brackets
                reg = /([\[\]])/g;
                json = json.replace(reg, '\r\n$1\r\n');

                // add newline after comma
                reg = /(\,)/g;
                json = json.replace(reg, '$1\r\n');

                // remove multiple newlines
                reg = /(\r\n\r\n)/g;
                json = json.replace(reg, '\r\n');

                // remove newlines before commas
                reg = /\r\n\,/g;
                json = json.replace(reg, ',');

                // optional formatting...
                if (!options.newlineAfterColonIfBeforeBraceOrBracket) {
                    reg = /\:\r\n\{/g;
                    json = json.replace(reg, ':{');
                    reg = /\:\r\n\[/g;
                    json = json.replace(reg, ':[');
                }
                if (options.spaceAfterColon) {
                    reg = /\:/g;
                    json = json.replace(reg, ': ');
                }

                $.each(json.split('\r\n'), function(index, node) {
                    var i = 0,
                        indent = 0,
                        padding = '';

                    if (node.match(/\{$/) || node.match(/\[$/)) {
                        indent = 1;
                    } else if (node.match(/\}/) || node.match(/\]/)) {
                        if (pad !== 0) {
                            pad -= 1;
                        }
                    } else {
                        indent = 0;
                    }

                    for (i = 0; i < pad; i++) {
                        padding += PADDING;
                    }

                    formatted += padding + node + '\r\n';
                    pad += indent;
                });
                return formatted;
            };

        });
    </script>
</body>
</html>
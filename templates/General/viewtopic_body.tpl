<script type="text/javascript">
    //<![CDATA[
    var multiquote_img_off = '{JS_MULTIQUOTE_IMG_OFF}',
        multiquote_img_on = '{JS_MULTIQUOTE_IMG_ON}';

    var multiquote_off = '<i class="fa fa-plus-circle"></i><span class="hide">Thêm đoạn trích</span>',
        multiquote_on = '<i class="fa fa-minus-circle"></i><span class="hide">Bỏ đoạn trích</span>';

    var hiddenMsgLabel = {
        visible: '{JS_HIDE_HIDDEN_MESSAGE}',
        hidden: '{JS_SHOW_HIDDEN_MESSAGE}'
    };

    var toggleMultiQuote = function(obj) {
        var toggle = (obj.innerHTML === multiquote_on);
        obj.innerHTML = toggle ? multiquote_off : multiquote_on;
        my_setcookie(obj.id.slice(2), toggle ? '' : '1', true);
        return false;
    };

    var showHiddenMessage = function(id) {
        try {
            var regId = parseInt(id, 10);
            if (isNaN(regId)) {
                regId = 0;
            }

            if (regId > 0) {
                $('.post--' + id).toggle(0, function() {
                    if ($(this).is(":visible")) {
                        $('#hidden-title--' + id).html(hiddenMsgLabel.visible);
                    } else {
                        $('#hidden-title--' + id).html(hiddenMsgLabel.hidden);
                    }
                });
            }
        } catch (e) {}

        return false;
    };

    $(function() {
        var cookie,
            obj;
        cookies = document.cookie.split('; ');
        for (i = 0, j = cookies.length; i < j; ++i) {
            if (cookies[i].substring(0, 7) === 'post_mq') {
                cookie = cookies[i].split('=');
                if (cookie[1] === '1' && (obj = document.getElementById("zz" + cookie[0]))) {
                    obj.innerHTML = multiquote_on;
                }
            }
        }
    });

    //]]>
</script>
<nav class="breadcrumb">
    <ul id="navstrip" class="clearfix" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
        <li class="begin"><a href="{U_INDEX}" itemprop="url"><span itemprop="title">{L_INDEX}</span></a></li>
        {NAV_CAT_DESC}
    </ul>
</nav>
<div class="borderwrap clearfix">
    <nav class="pagination topic-options left">
        <!-- BEGIN topicpagination -->
        {PAGINATION}
        <!-- END topicpagination -->
    </nav>
    <div class="posting-options topic-options right">
        <!-- BEGIN switch_user_authpost -->
        <a class="btn large" href="{U_POST_NEW_TOPIC}" accesskey="n" rel="nofollow"><i class="fa fa-plus fa-lg"></i><span>Gửi bài mới</span></a>
        <!-- END switch_user_authpost -->
        <!-- BEGIN switch_user_authreply -->
        <a class="btn large" href="{U_POST_REPLY_TOPIC}" accesskey="n" rel="nofollow"><i class="fa fa-reply-all fa-lg"></i><span>Trả lời</span></a>
        <!-- END switch_user_authreply -->
    </div>
</div>
{POLL_DISPLAY}
<article id="viewtopic" class="borderwrap">
    <div class="maintitle">
        <h1>{TOPIC_TITLE}</h1>
        <div id="topicmenu-options" class="popmenubutton">
            <!-- BEGIN switch_plus_menu -->
            <script type="text/javascript">
                //<![CDATA[
                var url_favourite = '{U_FAVOURITE_JS_PLUS_MENU}';
                var url_newposts = '{U_NEWPOSTS_JS_PLUS_MENU}';
                var url_egosearch = '{U_EGOSEARCH_JS_PLUS_MENU}';
                var url_unanswered = '{U_UNANSWERED_JS_PLUS_MENU}';
                var url_watchsearch = '{U_WATCHSEARCH_JS_PLUS_MENU}';
                var url_tellfriend = '{U_TELLFRIEND_JS_PLUS_MENU}';
                insert_plus_menu_new('f{FORUM_ID}&amp;t={TOPIC_ID}', '{JS_SESSION_ID}', {JS_AUTH_FAVOURITES}, '{JS_WATCH_TOPIC}');
                //]]>
            </script>
            <!-- END switch_plus_menu -->
        </div>
    </div>
    <div class="maincontent">
        <!-- BEGIN postrow -->
        <!-- BEGIN hidden -->
        <div class="postdetails {postrow.hidden.ROW_CLASS}" colspan="2" align="center">{postrow.hidden.MESSAGE}</div>
        <!-- END hidden -->
        <!-- BEGIN first_post_br -->
        <hr id="first-post-br" />
        <!-- END first_post_br -->
        <!-- BEGIN displayed -->
        <section id="p{postrow.displayed.U_POST_ID}" class="post post--{postrow.displayed.U_POST_ID}" style="{postrow.displayed.DISPLAYABLE_STATE}">
            <a class="post-anchor" name="{postrow.displayed.U_POST_ID}"></a>
            <div class="post-header clearfix">
                <span class="post-date">
                    <i class="fa fa-clock-o"></i>&nbsp;{postrow.displayed.POST_DATE_NEW}
                </span>
                <span class="thanks-post hide" {postrow.displayed.THANK_BGCOLOR}>
                    &nbsp;<i class="fa fa-star"></i>&nbsp;Bài viết hay nhất
                </span>
                <a class="post-count right" data-id="p{postrow.displayed.U_POST_ID}" href="#{postrow.displayed.U_POST_ID}"><i class="fa fa-hashtag"></i>{postrow.displayed.COUNT_POSTS}</a>
            </div>
            <div class="postprofile floated" id="profile{postrow.displayed.U_POST_ID}">
                <div class="postdetails clearfix">
                    <div class="author-avatar{postrow.displayed.ONLINE_IMG_NEW} left">
                        {postrow.displayed.POSTER_AVATAR}
                    </div>
                    <div class="author-details">
                        <div class="author-name"><a href="javascript:void(0);" {postrow.displayed.ONCLICK}>{postrow.displayed.POSTER_NAME_INV}&nbsp;<i class="fa fa-angle-down"></i></a></div>
                        <div class="author-rank">{postrow.displayed.RANK_IMAGE}</div>
                        <div class="author-links">
                            {postrow.displayed.PROFILE_IMG}
                            <!-- BEGIN user_logged_in -->
                            <!-- BEGIN switch_user_pm -->
                            &nbsp;{postrow.displayed.PM_IMG}
                            <!-- END switch_user_pm -->
                            <!-- BEGIN switch_user_email -->
                            &nbsp;{postrow.displayed.EMAIL_IMG}
                            <!-- END switch_user_email -->
                            <!-- BEGIN switch_contact_row -->
                            <!-- BEGIN contact_field -->
                            &nbsp;{postrow.displayed.user_logged_in.switch_contact_row.contact_field.CONTENT}
                            <!-- END contact_field -->
                            <!-- END switch_contact_row -->
                            <!-- BEGIN switch_user_posts -->
                            &nbsp;{postrow.displayed.USER_POSTS_IMG}
                            <!-- END switch_user_posts -->
                            <!-- END user_logged_in -->
                        </div>
                    </div>
                </div>
                <div id="pm{postrow.displayed.U_POST_ID}" class="author-stat floated" style="display:none;">
                    <!-- BEGIN profile_field -->
                    <div class="field-label">{postrow.displayed.profile_field.LABEL}<span class="field-content">{postrow.displayed.profile_field.CONTENT}</span></div>
                    <!-- END profile_field -->
                </div>
            </div>
            <div class="post-entry">
                <div class="post-contents">{postrow.displayed.MESSAGE}</div>
                <!-- BEGIN switch_attachments -->
                <dl class="attachbox">
                    <dt>{postrow.displayed.switch_attachments.L_ATTACHMENTS}</dt>
                    <dd>
                        <!-- BEGIN switch_post_attachments -->
                        <dl class="file">
                            <dt>
                                <img src="{postrow.displayed.switch_attachments.switch_post_attachments.U_IMG}" alt="" />
                                <!-- BEGIN switch_dl_att -->
                                <a class="postlink" href="{postrow.displayed.switch_attachments.switch_post_attachments.switch_dl_att.U_ATTACHMENT}">{postrow.displayed.switch_attachments.switch_post_attachments.switch_dl_att.ATTACHMENT}</a> {postrow.displayed.switch_attachments.switch_post_attachments.switch_dl_att.ATTACHMENT_DEL}
                                <!-- END switch_dl_att -->
                                <!-- BEGIN switch_no_dl_att -->
                                {postrow.displayed.switch_attachments.switch_post_attachments.switch_no_dl_att.ATTACHMENT} {postrow.displayed.switch_attachments.switch_post_attachments.switch_no_dl_att.ATTACHMENT_DEL}
                                <!-- END switch_no_dl_att -->
                            </dt>
                            <!-- BEGIN switch_no_comment -->
                            <dd>
                                <em>{postrow.displayed.switch_attachments.switch_post_attachments.switch_no_comment.ATTACHMENT_COMMENT}</em>
                            </dd>
                            <!-- END switch_no_comment -->
                            <!-- BEGIN switch_no_dl_att -->
                            <dd>
                                <em><strong>{postrow.displayed.switch_attachments.switch_post_attachments.switch_no_dl_att.TEXT_NO_DL}</strong></em>
                            </dd>
                            <!-- END switch_no_dl_att -->
                            <dd>({postrow.displayed.switch_attachments.switch_post_attachments.FILE_SIZE}) {postrow.displayed.switch_attachments.switch_post_attachments.NB_DL}</dd>
                        </dl>
                        <!-- END switch_post_attachments -->
                    </dd>
                </dl>
                <!-- END switch_attachments -->
                <!-- BEGIN switch_signature -->
                <div id="sig{postrow.displayed.U_POST_ID}" class="signature_div">{postrow.displayed.SIGNATURE_NEW}</div>
                <!-- END switch_signature -->
                <div class="clear"></div>
            </div>
            <div class="post-footer clearfix">
                <!-- zzVotePlus by Zzbaivong - devs.forumvi.com -->
                <div class="vote_zzvote left">
                    <!-- BEGIN switch_vote_active -->
                    <a class="vote_plus" href="<!-- BEGIN switch_vote -->{postrow.displayed.switch_vote_active.switch_vote.U_VOTE_PLUS}<!-- END switch_vote -->">+<span class="vote_time" data-vote="<!-- BEGIN switch_bar -->{postrow.displayed.switch_vote_active.L_VOTE_TITLE}<!-- END switch_bar --><!-- BEGIN switch_no_bar -->{postrow.displayed.switch_vote_active.L_VOTE_TITLE}<!-- END switch_no_bar -->">1</span></a>
                    <!-- END switch_vote_active -->
                </div>
                <div class="post-action right">
                    {postrow.displayed.THANK_IMG}
                    <a href="?thank={postrow.displayed.U_POST_ID}" class="thanks post-btn"><i class="fa fa-thumbs-up"></i><span class="hide">Cảm ơn</span></a> {postrow.displayed.MULTIQUOTE_IMG}
                    <a id="zzpost_mq{TOPIC_ID}_{postrow.displayed.U_POST_ID}" onclick="toggleMultiQuote(this);" href="javascript:void(0);" class="multiquote post-btn"><i class="fa fa-plus-circle"></i><span class="hide">Thêm đoạn trích</span></a> {postrow.displayed.QUOTE_IMG}
                    <a href="/post?p={postrow.displayed.U_POST_ID}&amp;mode=quote" class="quote post-btn"><i class="fa fa-quote-right"></i><span class="hide">Trích dẫn</span></a> {postrow.displayed.EDIT_IMG}
                    <a href="/post?p={postrow.displayed.U_POST_ID}&amp;mode=editpost" class="edit post-btn"><i class="fa fa-pencil"></i><span class="hide">Sửa</span></a> {postrow.displayed.DELETE_IMG}
                    <a href="/post?p={postrow.displayed.U_POST_ID}&amp;mode=delete" class="delete post-btn"><i class="fa fa-times"></i><span class="hide">Xóa</span></a>
                    <a href="/report?p={postrow.displayed.U_POST_ID}&amp;mode=report" class="report post-btn"><i class="fa fa-flag"></i><span class="hide">Báo lỗi</span></a> {postrow.displayed.IP_IMG}
                    <a href="/modcp?t={TOPIC_ID}&amp;p={postrow.displayed.U_POST_ID}&amp;mode=ip" class="findip post-btn"><i class="fa fa-map-marker"></i><span class="hide">Xem IP</span></a>
                </div>
            </div>
        </section>
        <!-- closing tag post -->
        <!-- END displayed -->
        <!-- END postrow -->
    </div>
    <div class="module inner clearfix">
        <div class="search-footer-box left">
            <form method="get" action="{S_SEARCHBOX_ACTION}">
                <fieldset>
                    <input type="search" name="search_keywords" id="search_keywords" size="20" value="" placeholder="Tìm trong mục này" /> &nbsp;
                    <input class="button fa" type="submit" value="" />
                    <input type="hidden" value="{SEARCH_WHERE}" name="search_where" />
                    <input type="hidden" value="{SEARCH_TOPIC}" name="search_topic" />
                    <input type="hidden" value="posts" name="show_results" />
                </fieldset>
            </form>
        </div>
        <nav class="next-prev right">
            <a href="{U_VIEW_OLDER_TOPIC}" class="btn"><i class="fa fa-hand-o-left"></i><span class="hide">Bài trước</span></a>
            <a href="{U_VIEW_NEWER_TOPIC}" class="btn"><span class="hide">Bài sau</span><i class="fa fa-hand-o-right"></i></a>
        </nav>
    </div>
</article>
<div class="borderwrap clearfix">
    <nav class="pagination topic-options left">
        <!-- BEGIN topicpagination -->
        {PAGINATION}
        <!-- END topicpagination -->
    </nav>
    <div class="posting-options topic-options right">
        <!-- BEGIN switch_user_authpost -->
        <a class="btn large" href="{U_POST_NEW_TOPIC}" accesskey="n" rel="nofollow"><i class="fa fa-plus fa-lg"></i><span>Gửi bài mới</span></a>
        <!-- END switch_user_authpost -->
        <!-- BEGIN switch_user_authreply -->
        <a class="btn large" href="{U_POST_REPLY_TOPIC}" accesskey="n" rel="nofollow"><i class="fa fa-reply-all fa-lg"></i><span>Trả lời</span></a>
        <!-- END switch_user_authreply -->
    </div>
</div>
<div class="borderwrap module clearfix">
    <div class="left mod-controls">
        <input type="hidden" name="t" value="{TOPIC_ID}" />
        <!-- <input type="hidden" name="sid" value="{S_SID}" /> -->
        <input type="hidden" name="{SECURE_ID_NAME}" value="{SECURE_ID_VALUE}" /> {S_TOPIC_ADMIN}
    </div>
    <div class="right">
        {S_AUTH_LIST}
    </div>
</div>
<!-- BEGIN switch_forum_rules -->
<div class="borderwrap module" id="forum_rules">
    <div class="maintitle">
        <h3>{L_FORUM_RULES}</h3>
    </div>
    <table>
        <tr>
            <!-- BEGIN switch_forum_rule_image -->
            <td class="logo">
                <img src="{RULE_IMG_URL}" alt="" />
            </td>
            <!-- END switch_forum_rule_image -->
            <td class="rules post-entry">
                {RULE_MSG}
            </td>
        </tr>
    </table>
</div>
<!-- END switch_forum_rules -->
<!-- BEGIN promot_trafic -->
<aside class="borderwrap">
    <div class="maintitle clearfix">
        <h3>{PROMOT_TRAFIC_TITLE}</h3>
        <div class="contract" id="bptrafic" onclick="toggleCategory('ptrafic');">
            &nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div id="ptrafic" class="maincontent">
        <!-- BEGIN link -->
        &raquo;&nbsp;<a href="{promot_trafic.link.U_HREF}" target="_blank" title="{promot_trafic.link.TITLE}">{promot_trafic.link.TITLE}</a>
        <br />
        <!-- END link -->
    </div>
</aside>
<!-- END promot_trafic -->
<!-- BEGIN switch_user_logged_in -->
<a name="quickreply"></a>
{QUICK_REPLY_FORM}
<!-- END switch_user_logged_in -->
<!-- BEGIN switch_image_resize -->
<script type="text/javascript">
    //<![CDATA[
    $(resize_images({
        'selector': '.postbody .post-entry',
        'max_width': {switch_image_resize.IMG_RESIZE_WIDTH},
        'max_height': {switch_image_resize.IMG_RESIZE_HEIGHT}
    }));
    //]]>
</script>
<!-- END switch_image_resize -->

<!-- zzVotePlus by Zzbaivong - devs.forumvi.com -->
<script type="text/javascript">
    //<![CDATA[
    $(".vote_zzvote:empty").html('<a class="vote_plus dis" href="javascript:;">+<span class="vote_time" data-vote="Message not voted">1</span></a>');
    $(".vote_time").text(function() {
        var a = $(this).data("vote");
        if ("Message not voted" == a) return $(this).data("vote", 0), 1;
        a = a.split(/\W/);
        time = parseInt(a[7], 10);
        percent = parseInt(a[4], 10);
        plus = Math.round(percent / 100 * time);
        $(this).data("vote", plus);
        if (0 !== plus) return plus;
    });
    $(".vote_plus").on("click", function(a) {
        a.preventDefault();
        var b = $(this),
            c = $(".vote_time", b); - 1 != this.href.indexOf("eval=plus&p_vote") && (b.css("background-image", "url(http://i57.servimg.com/u/f57/17/05/17/70/preloa10.gif)"), $.post(this.href, function() {
            c.text(parseInt(c.data("vote"), 10) + 1);
            $post = b.closest(".post");
            $.post("/privmsg", {
                subject: "Bài viết hay",
                message: "Mình thích bài viết của bạn tại [url=" + location.origin + location.pathname + "?showpost=" + $post.attr("id") + "]" + document.title + "[/url]",
                username: $.trim($post.find(".author-name").text()),
                u: $post.find(".author-avatar a").attr("href").replace(/(.*\/u)(\d+)(.*)/, "$2"),
                mode: "post_profile",
                folder: "profile",
                post: "Send"
            }, function() {
                b.removeAttr("style");
            })
        }), this.href = "");
    });

    (function(a) {
        a('strong:contains("Tags: ")').hide().prev("br, hr").hide().prev("hr").hide();
        a('a[title^="See all tagged subjects with:"]', ".post-entry").replaceWith(function() {
            return a("<a>", {
                href: this.href,
                "class": "tags",
                text: this.textContent.replace("#", "").replace(/-/g, " ")
            })
        });
        a(".post-entry").each(function() {
            a(this).find(".tags").wrapAll('<div class="tagsGroup"></div>')
        })
    })(jQuery);

    (function($) {
        function showpost(postid) {
            history.replaceState(null, null, "?showpost=" + postid);
            $body.addClass("showpost");
            $("#" + postid).show().after('<a id="stopShowpost" data-id="' + postid + '" href="#' + postid + '" class="btn large"><div class="center"><i class="fa fa-angle-double-up"></i> Xem toàn bộ chủ đề <i class="fa fa-angle-double-up"></i></div></a>');
            $html.animate({
                scrollTop: 0
            });
        }

        var param = GetParam("showpost"),
            $html = $("html, body"),
            $body = $("body");

        if (param !== null) showpost(param);

        $(".post-count").on("contextmenu", function(e) {
            e.preventDefault();
            var $t = $(this),
                postid = $t.data("id");
            if (GetParam("showpost") === null) showpost(postid);
        }).on("click", function(e) {
            e.preventDefault();
            var $t = $(this);
            $html.animate({
                scrollTop: $("#" + $t.data("id")).offset().top
            });
        });

        $("#viewtopic").on("click", "#stopShowpost", function(e) {
            e.preventDefault();
            var $t = $(this);

            history.replaceState(null, null, location.pathname);
            $body.removeClass("showpost");
            $t.remove();
            $("#" + $t.data("id")).removeAttr("style").find(".post-count").trigger("click");
        });
    })(jQuery);

    (function($) {
        $(".post").find("a[href*='&mode=quote']").attr("href", function() {
            return this.href + "&r=" + location.pathname.replace(/\/(t\d+(p\d+)?)\-.*/, "$1")
        });

        $(".post").find("a[href*='/t'][href*='-quote#']").each(function() {
            var $this = $(this),
                $p = $this.parent();

            if ($p[0].tagName === "P") {
                $this.appendTo($p.next().find("cite:first"));
                $p.remove();
            } else {
                $this.next("br").remove();
                $this.appendTo($this.next("blockquote").find("cite:first"));
            }

            $this.addClass("quoteLink fa fa-arrow-up").css("margin-left", "5px").attr("href", function() {
                var a = /\/(t\d+(p\d+)?)-/;
                if (a.test(location.pathname) && this.pathname.match(a)[1] === location.pathname.match(a)[1]) return "#" + this.href.split("#")[1]
            });
        });
    })(jQuery);
    //]]>
</script>

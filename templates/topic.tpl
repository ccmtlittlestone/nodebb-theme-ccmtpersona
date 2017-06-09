<style media="screen">
	.i_star{
		color: #23527c;
	}
</style>
<!-- IMPORT partials/breadcrumbs.tpl -->
<div widget-area="header"></div>
<div class="row">
	<div class="topic col-lg-12 col-sm-12" has-widget-class="topic col-lg-9 col-sm-12" has-widget-target="sidebar">

		<h1 component="post/header" class="hidden-xs" itemprop="name">

			<i class="pull-left fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->" title="[[topic:pinned]]"></i>
			<i class="pull-left fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->" title="[[topic:locked]]"></i>
			<i class="pull-left fa fa-arrow-circle-right <!-- IF !oldCid -->hidden<!-- ENDIF !oldCid -->" title="[[topic:moved]]"></i>
			<!-- BEGIN icons -->@value<!-- END icons -->

			<span class="topic-title" component="topic/title">{title}</span>
		</h1>

		<div component="topic/deleted/message" class="alert alert-warning<!-- IF !deleted --> hidden<!-- ENDIF !deleted --> clearfix">
			<span class="pull-left">[[topic:deleted_message]]</span>
			<span class="pull-right">
				<!-- IF deleter -->
				<a href="{config.relative_path}/user/{deleter.userslug}">
					<strong>{deleter.username}</strong>
				</a>
				<small class="timeago" title="{deletedTimestamp}"></small>
				<!-- ENDIF deleter -->
			</span>
		</div>

		<hr class="visible-xs" />

		<ul component="topic" class="posts" data-tid="{tid}" data-cid="{cid}">
			<!-- BEGIN posts -->
				<li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
					<a component="post/anchor" data-index="{posts.index}" name="{posts.index}"></a>

					<meta itemprop="datePublished" content="{posts.timestampISO}">
					<meta itemprop="dateModified" content="{posts.editedISO}">

					<!-- IMPORT partials/topic/post.tpl -->
					<!-- IF !posts.index -->
					<div class="post-bar-placeholder"></div>
					<!-- ENDIF !posts.index -->
				</li>
			<!-- END posts -->
		</ul>

		<!-- IF config.enableQuickReply -->
		<!-- IMPORT partials/topic/quickreply.tpl -->
		<!-- ENDIF config.enableQuickReply -->

		<div class="post-bar">
			<!-- IF config.enableAutoReply -->
			<div class="">
				<p>
					<span class="i_star">[[topic:topic_to_recommend]]</span>
				</p>
				<ul>
				<!-- BEGIN relatedTopics -->

					<li style="float:left; list-style-type: none;margin-right:5%;line-height:20px;"><a href="/topic/{relatedTopics.tid}"><i class="fa fa-arrow-circle-o-right"></i> {relatedTopics.title}</a></li>

				<!-- END relatedTopics -->
				</ul>
			</div>
			<div style="clear:both;height:20px"></div>
			<!-- ENDIF config.enableAutoReply -->
			<!-- IMPORT partials/post_bar.tpl -->
		</div>


		<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->

		<div class="visible-xs visible-sm pagination-block text-center">
			<div class="progress-bar"></div>
			<div class="wrapper">
				<i class="fa fa-2x fa-angle-double-up pointer fa-fw pagetop"></i>
				<i class="fa fa-2x fa-angle-up pointer fa-fw pageup"></i>
				<span class="pagination-text"></span>
				<i class="fa fa-2x fa-angle-down pointer fa-fw pagedown"></i>
				<i class="fa fa-2x fa-angle-double-down pointer fa-fw pagebottom"></i>
			</div>
		</div>
	</div>
	<div widget-area="sidebar" class="col-lg-3 col-sm-12 hidden"></div>
</div>
<div widget-area="footer"></div>

<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->

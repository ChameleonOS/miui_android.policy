.class Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;
.super Ljava/lang/Thread;
.source "WebServiceBinder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/app/screenelement/data/WebServiceBinder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "QueryThread"
.end annotation


# instance fields
.field final synthetic this$0:Lmiui/app/screenelement/data/WebServiceBinder;


# direct methods
.method public constructor <init>(Lmiui/app/screenelement/data/WebServiceBinder;)V
    .registers 3
    .parameter

    .prologue
    iput-object p1, p0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    const-string v0, "WebServiceBinder QueryThread"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 19

    .prologue
    const-string v15, "WebServiceBinder"

    const-string v16, "QueryThread start"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    iget-object v15, v15, Lmiui/app/screenelement/data/WebServiceBinder;->mUriFormatter:Lmiui/app/screenelement/util/TextFormatter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    move-object/from16 v16, v0

    #getter for: Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;
    invoke-static/range {v16 .. v16}, Lmiui/app/screenelement/data/WebServiceBinder;->access$000(Lmiui/app/screenelement/data/WebServiceBinder;)Lmiui/app/screenelement/ScreenContext;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lmiui/app/screenelement/util/TextFormatter;->getText(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v14

    .local v14, uri:Landroid/net/Uri;
    new-instance v11, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v11, v15}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .local v11, request:Lorg/apache/http/client/methods/HttpPost;
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    #getter for: Lmiui/app/screenelement/data/WebServiceBinder;->mParamsFormatter:Lmiui/app/screenelement/util/TextFormatter;
    invoke-static {v15}, Lmiui/app/screenelement/data/WebServiceBinder;->access$100(Lmiui/app/screenelement/data/WebServiceBinder;)Lmiui/app/screenelement/util/TextFormatter;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    move-object/from16 v16, v0

    #getter for: Lmiui/app/screenelement/data/WebServiceBinder;->mContext:Lmiui/app/screenelement/ScreenContext;
    invoke-static/range {v16 .. v16}, Lmiui/app/screenelement/data/WebServiceBinder;->access$000(Lmiui/app/screenelement/data/WebServiceBinder;)Lmiui/app/screenelement/ScreenContext;

    move-result-object v16

    move-object/from16 v0, v16

    iget-object v0, v0, Lmiui/app/screenelement/ScreenContext;->mVariables:Lmiui/app/screenelement/data/Variables;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Lmiui/app/screenelement/util/TextFormatter;->getText(Lmiui/app/screenelement/data/Variables;)Ljava/lang/String;

    move-result-object v10

    .local v10, paramsStr:Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, paramsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_84

    new-instance v9, Ljava/util/ArrayList;

    .end local v9           #paramsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .restart local v9       #paramsList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    const-string v15, ","

    invoke-virtual {v10, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .local v8, params:[Ljava/lang/String;
    move-object v1, v8

    .local v1, arr$:[Ljava/lang/String;
    array-length v5, v1

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_5f
    if-ge v4, v5, :cond_84

    aget-object v6, v1, v4

    .local v6, pa:Ljava/lang/String;
    const-string v15, ":"

    invoke-virtual {v6, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .local v7, param:[Ljava/lang/String;
    array-length v15, v7

    const/16 v16, 0x2

    move/from16 v0, v16

    if-eq v15, v0, :cond_73

    :goto_70
    add-int/lit8 v4, v4, 0x1

    goto :goto_5f

    :cond_73
    new-instance v15, Lorg/apache/http/message/BasicNameValuePair;

    const/16 v16, 0x0

    aget-object v16, v7, v16

    const/16 v17, 0x1

    aget-object v17, v7, v17

    invoke-direct/range {v15 .. v17}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_70

    .end local v1           #arr$:[Ljava/lang/String;
    .end local v4           #i$:I
    .end local v5           #len$:I
    .end local v6           #pa:Ljava/lang/String;
    .end local v7           #param:[Ljava/lang/String;
    .end local v8           #params:[Ljava/lang/String;
    :cond_84
    :try_start_84
    new-instance v15, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v16, "UTF-8"

    move-object/from16 v0, v16

    invoke-direct {v15, v9, v0}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v11, v15}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    new-instance v15, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v15}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    invoke-virtual {v15, v11}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v3

    .local v3, httpResponse:Lorg/apache/http/HttpResponse;
    const/4 v12, 0x0

    .local v12, result:Ljava/lang/String;
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v15

    invoke-interface {v15}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v13

    .local v13, statusCode:I
    const/16 v15, 0xc8

    if-ne v13, v15, :cond_ae

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v15

    invoke-static {v15}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v12

    :cond_ae
    const-string v15, "WebServiceBinder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "QueryThread get result: "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " \n"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    #calls: Lmiui/app/screenelement/data/WebServiceBinder;->onQueryComplete(Ljava/lang/String;)V
    invoke-static {v15, v12}, Lmiui/app/screenelement/data/WebServiceBinder;->access$200(Lmiui/app/screenelement/data/WebServiceBinder;Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    #setter for: Lmiui/app/screenelement/data/WebServiceBinder;->mLastQueryTime:J
    invoke-static/range {v15 .. v17}, Lmiui/app/screenelement/data/WebServiceBinder;->access$302(Lmiui/app/screenelement/data/WebServiceBinder;J)J
    :try_end_e6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_84 .. :try_end_e6} :catch_f7
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_84 .. :try_end_e6} :catch_115
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_e6} :catch_133

    .end local v3           #httpResponse:Lorg/apache/http/HttpResponse;
    .end local v12           #result:Ljava/lang/String;
    .end local v13           #statusCode:I
    :goto_e6
    move-object/from16 v0, p0

    iget-object v15, v0, Lmiui/app/screenelement/data/WebServiceBinder$QueryThread;->this$0:Lmiui/app/screenelement/data/WebServiceBinder;

    const/16 v16, 0x0

    #setter for: Lmiui/app/screenelement/data/WebServiceBinder;->mQueryInProgress:Z
    invoke-static/range {v15 .. v16}, Lmiui/app/screenelement/data/WebServiceBinder;->access$402(Lmiui/app/screenelement/data/WebServiceBinder;Z)Z

    const-string v15, "WebServiceBinder"

    const-string v16, "QueryThread end"

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catch_f7
    move-exception v2

    .local v2, e:Ljava/io/UnsupportedEncodingException;
    const-string v15, "WebServiceBinder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "fail to run query, "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_e6

    .end local v2           #e:Ljava/io/UnsupportedEncodingException;
    :catch_115
    move-exception v2

    .local v2, e:Lorg/apache/http/client/ClientProtocolException;
    const-string v15, "WebServiceBinder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "fail to run query, "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Lorg/apache/http/client/ClientProtocolException;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_e6

    .end local v2           #e:Lorg/apache/http/client/ClientProtocolException;
    :catch_133
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    const-string v15, "WebServiceBinder"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "fail to run query, "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_e6
.end method

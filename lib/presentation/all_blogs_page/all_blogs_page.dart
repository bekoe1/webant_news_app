import 'dart:developer';

import 'package:bloc_test_app/presentation/all_Blogs_page/bloc/all_blogs_bloc.dart';
import 'package:bloc_test_app/presentation/current_article_page/current_article_page.dart';
import 'package:bloc_test_app/utils/nav_bar_helper.dart';
import 'package:bloc_test_app/utils/text_styles.dart';
import 'package:bloc_test_app/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/news_list.dart';

class AllBlogsPage extends StatefulWidget {
  const AllBlogsPage({super.key});

  @override
  State<AllBlogsPage> createState() => _AllBlogsPageState();
}

class _AllBlogsPageState extends State<AllBlogsPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
      final state = context.read<AllBlogsBloc>().state;
      if (state is BlogsFetchedSuccessfully && !state.isLoading) {
        context.read<AllBlogsBloc>().add(
              FetchingBlogsEvent(),
            );
        log("fetch");
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: isSearching
            ? CustomTextForm(
                controller: _searchController,
                width: 250,
                height: 50,
                onChanged: (text) {
                  context.read<AllBlogsBloc>().add(
                        SearchingBlogsEvent(text: text),
                      );
                },
              )
            : Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 5),
                child: const Text(
                  "All Blogs",
                  style: MyTextStyles.appBarTitleStyle,
                ),
              ),
        leading: !isSearching
            ? IconButton(
                onPressed: () {
                  setState(
                    () {
                      isSearching = !isSearching;
                    },
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              )
            : BackButton(onPressed: () {
                if (_searchController.text != "") {
                  context.read<AllBlogsBloc>().add(RefreshingBlogsEvent());
                  _searchController.text = "";
                }
                setState(
                  () {
                    isSearching = !isSearching;
                  },
                );
              }),
      ),
      body: BlocConsumer<AllBlogsBloc, AllBlogsState>(
        listener: (context, state) {
          if (state is BlogsFetchedWithError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.grey,
                duration: const Duration(seconds: 4),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is BlogsFetchedSuccessfully) {
            if (isSearching) {
              return NewsList(
                articles: state.blogs,
                scrollController: _scrollController,
                isLoading: state.isLoading,
                onTap: (index) {
                  NavigationBarState().setShowNavigationBar(false);
                  navigateToArticle(context, index);
                },
              );
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<AllBlogsBloc>().add(RefreshingBlogsEvent());
                },
                child: NewsList(
                  articles: state.blogs,
                  scrollController: _scrollController,
                  isLoading: state.isLoading,
                  onTap: (index) {
                    NavigationBarState().setShowNavigationBar(false);
                    navigateToArticle(context, index);
                  },
                ),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  void navigateToArticle(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CurrentArticlePage(
          id: index,
          isBlog: true,
        ),
      ),
    );
  }
}

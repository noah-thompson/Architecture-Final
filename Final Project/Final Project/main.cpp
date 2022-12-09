// main.cpp
#include <iostream>
#include <ostream>
using namespace std;

#pragma pack(1)
struct Node
{
	int value;
	Node *left;
	Node *right;
	Node()
	{
		value = 0;
		left = NULL;
		right = NULL;
	};
	Node(int val)
	{
		value = val;
		left = NULL;
		right = NULL;
	};
	Node* addNode(Node* node, int val)
	{
		if (!node)
		{
			return new Node(val);
		}
		if (val < node->value)
		{
			node->left = addNode(node->left, val);
		}
		else
		{
			node->right = addNode(node->right, val);
		}

		return node;
	};
};
extern "C" int asmMain();
extern "C" int inOrder(Node*);

int main() 
{
	int num;
	Node head = Node(10);
	// head.addNode(&head, 5);
	//head.addNode(&head, 3);
	//head.addNode(&head, 15);
	//num = asmMain();
	num = inOrder(&head);
	cout << num;
	return 0;
}